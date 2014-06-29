# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Type < ActiveRecord::Base
  attr_accessible :name

  has_many :ads, :dependent => :destroy

  validates :name, :presence => true, :length => { :in => 2..10 }
end
