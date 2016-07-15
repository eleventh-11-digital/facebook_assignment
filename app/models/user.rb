require 'bcrypt'

class User < ActiveRecord::Base
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :password, :confirmation => true
	validates_length_of :password, :in => 6..20, :on => :create

	has_secure_password
	has_many :statuses
	has_many :likes
	has_many :friends
end
