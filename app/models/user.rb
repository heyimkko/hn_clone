class User < ActiveRecord::Base
	validates :name, :email, :password_hash, :presence => true
  has_many :posts
  has_many :comments
  has_one :post_vote
  has_one :comment_vote
end
