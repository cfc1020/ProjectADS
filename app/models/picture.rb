class Picture < ActiveRecord::Base
	attr_accessible :url
  	attr_protected  :ad_id

  	belongs_to      :ad, :dependent => :destroy

  	URL_PATTERN = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ 
  	#/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  	#validates :url, :presence => true, :format => { :with => URL_PATTERN }


end
