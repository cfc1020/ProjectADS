class Picture < ActiveRecord::Base
  attr_accessible :url
  attr_protected  :ad_id

  belongs_to      :ad

  URL_PATTERN = /\A^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$\z/

  validates :url, :format => { :with => URL_PATTERN }
end
