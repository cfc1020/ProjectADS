class Picture < ActiveRecord::Base
	attr_accessible :url
  	attr_protected  :ad_id

  	belongs_to      :ad

  	URL_PATTERN = /\A^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$\z/
  	#/\A\.(gif|jpg|png)\z/
  	#/^((http(s?)\:\/\/|~/|/)?([\w]+:\w+@)?([a-zA-Z]{1}([\w-]+.)+([\w]{2,5}))(:[\d]{1,5})?((/?\w+/)+|/?)(\w+.(jpg|png|gif)))/
  	#/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ 
  	#/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  	validates :url, :presence => true, :format => { :with => URL_PATTERN }


end
