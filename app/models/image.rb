class Image < ActiveRecord::Base
  attr_accessible :photo, :url
  attr_protected  :ad_id

  belongs_to      :ad

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :photo
end
