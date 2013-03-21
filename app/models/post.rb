class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :user_id, :title, :url, :presence => true
end
