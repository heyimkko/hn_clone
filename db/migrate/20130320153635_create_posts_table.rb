class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |c|
      c.integer :author_id
      c.text :content, :null => true
      c.integer :points, :default => 0
      c.string :title, :limit => 100
      c.string :url
      c.timestamps
    end
  end
end
