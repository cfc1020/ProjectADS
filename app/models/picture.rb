class Picture < ActiveRecord::Base
	attr_accessible :url
  	attr_protected  :ad_id

  	belongs_to      :ad
end
