# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  ad_id              :integer
#

class Image < ActiveRecord::Base
  attr_accessible :photo, :url
  attr_protected  :ad_id

  belongs_to      :ad

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :photo

  def image_full
    self.photo.url
  end
  def image_thumb
    self.photo.url(:thumb)
  end
end
