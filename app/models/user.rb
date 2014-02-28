class User < ActiveRecord::Base
	extend Enumerize

	has_many :ads

  	enumerize :role, in: [:user, :admin], default: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :name,  presence: true, length:  { in: 6..20 } 
	attr_accessible :email, :password, :password_confirmation, :remember_me, :name
	
end
