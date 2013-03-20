class Post < ActiveRecord::Base
  belongs_to :user
  validates :author_id, :title, :url, :presence => true
end
