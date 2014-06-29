# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  user_id    :integer
#  ad_id      :integer
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#

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
