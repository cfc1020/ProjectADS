class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad

  attr_accessible :text, :user_id, :ad_id
  
  validates :text, :presence => true, length: { minimum: 2, maximum: 1000 }
  validates :user_id, :presence => true
  validates :ad_id, :presence => true
end
