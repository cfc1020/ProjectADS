class Picture < ActiveRecord::Base
  attr_accessible :url, :photo
  attr_protected  :ad_id

  belongs_to      :ad

  #URL_PATTERN = /\A^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$\z/

  #validates :url, :format => { :with => URL_PATTERN }

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
