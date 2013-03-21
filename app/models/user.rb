class User < ActiveRecord::Base
	validates :name, :email, :password_hash, :presence => true
  has_many :posts
  has_many :comments
end
