class Type < ActiveRecord::Base
  attr_accessible :name

  has_many :ads, :dependent => :destroy

  validates :name, :presence => true, :length => { :in => 2..10 }
end
