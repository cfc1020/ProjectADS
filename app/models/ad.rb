class Ad < ActiveRecord::Base
	  belongs_to :user
	  belongs_to :type
	  has_many   :pictures, :dependent => :destroy
  	#validates  :user_id, presence: true

    #temporarily
    validates :content, :presence => true#, :length => { :in 10..1000 }
    validates :type, :presence => true
    validates :user, :presence => true  

  	attr_accessible :content, :user_id, :type_id, :pictures_attributes
  	attr_protected  :state

  	accepts_nested_attributes_for :pictures, :reject_if => :all_blank,
                                :allow_destroy => true


  	state_machine :initial => :draft do

    	event :publish do
      		transition :approved => :published
    	end

    	event :rejecte do
      		transition :pending => :rejected
    	end

    	event :send_to_arch do
      		transition :published => :archives
    	end

    	event :approve do
      		transition :pending => :approved
    	end

    	event :send_to_pending do
      		transition :draft => :pending
    	end

    	event :send_to_draft do
      		transition [:published, :approved, :rejected, :pending, :archives] => :draft
    	end
  	end

    def time_out?
      self.updated_at <= Date.current - 3.days
    end

    def self.Published!
      Ad.find_all_by_state("approved").each do |ad|
        ad.publish
      end
    end

    def self.Archives!
      Ad.find_all_by_state("published").each do |ad|
        ad.send_to_arch if ad.time_out?
      end
    end

end
