class CreatePostVotesTable < ActiveRecord::Migration
  def change
    create_table :post_votes do |c|
      c.integer :post_id
      c.integer :user_id
    end
  end
end
