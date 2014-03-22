class User < ActiveRecord::Base
  extend Enumerize

  has_many :ads, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  enumerize :role, in: [:user, :admin], default: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name,  presence: true, length:  { in: 6..20 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :role,  presence: true
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name 
  attr_protected	:role
end
