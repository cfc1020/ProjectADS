class Ad < ActiveRecord::Base
	belongs_to :user
  	#validates  :user_id, presence: true

  	attr_accessible :content, :user_id
  	#attr_protected :user_id
end
