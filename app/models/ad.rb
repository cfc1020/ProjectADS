class Ad < ActiveRecord::Base
	belongs_to :user
	belongs_to :type
	has_many   :pictures
  	#validates  :user_id, presence: true

  	attr_accessible :content, :user_id, :type_id, :pictures_attributes
  	attr_protected  :state

  	accepts_nested_attributes_for :pictures, :reject_if => :all_blank,
                                :allow_destroy => true


  	state_machine :initial => :draft do
  		state :draft, value: 0
    	state :pending, value: 1
    	state :published, value: 2
    	state :rejected, value: 3
    	state :approved, value: 4
    	state :archives, value: 5

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

end
