class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad

  attr_accessible :text
  attr_protected :user_id, :ad_id
  
  validates :text, :presence => true, length: { minimum: 2, maximum: 1000 }
  validates :user, :presence => true
  validates :ad, :presence => true
  
  sync :all
end
