
class PostTag < ActiveRecord::Base

  validates_uniqueness_of :tag_id, :scope => post_id,
                          :message => 'already has that tag'

  belongs_to :tag
  belongs_to :post

end
