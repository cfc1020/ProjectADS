require 'elasticsearch/model'

class Ad < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :type
  has_many   :pictures, :dependent => :destroy
  has_many   :images, :dependent => :destroy
  has_many   :comments,  :dependent => :destroy

  validates :content, :presence => true, length: { minimum: 2, maximum: 1000 }
  validates :type, :presence => true
  validates :user, :presence => true  

  attr_accessible :content, :user_id, :type_id, :pictures_attributes
  attr_protected  :state

  accepts_nested_attributes_for :pictures, :reject_if => :all_blank,
                                :allow_destroy => true
  accepts_nested_attributes_for :images, :reject_if => :all_blank,
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

  def self.method_missing(meth, *args)
    proc = Proc.new { return where(:state => meth.to_s) }

    state_machine.states.each do |st|
      proc.call if meth.to_s == st.name.to_s
    end
    super
  end

  def self.respond_to_missing?(meth, include_private = false)
    state_machine.states.each do |st|
      return true if meth.to_s == st.name.to_s
    end
    super
  end
end
