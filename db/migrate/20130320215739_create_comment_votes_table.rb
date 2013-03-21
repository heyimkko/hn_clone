class CreateCommentVotesTable < ActiveRecord::Migration
  def change
    create_table :comment_votes do |c|
      c.integer :comment_id
      c.integer :user_id
    end
  end
end
