class CreatePostTags < ActiveRecord::Migration

  def change
    create_table :posts do |t|
      t.text    :body
      t.string  :title
      t.string  :author
      t.string  :email

      t.timestamp  
    end

    create_table :tags do |t|
      t.string   :name

      t.timestamp
    end

    create_table :post_tags do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamp
    end

  end

end
