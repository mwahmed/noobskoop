class CreateDThreadReplyRatings < ActiveRecord::Migration
  def self.up
    create_table :d_thread_reply_ratings do |t|
      t.integer :reply_id
      t.integer :user_id
      t.integer :likes

      t.timestamps
    end
  end

  def self.down
    drop_table :d_thread_reply_ratings
  end
end
