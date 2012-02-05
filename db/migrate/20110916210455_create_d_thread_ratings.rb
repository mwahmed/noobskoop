class CreateDThreadRatings < ActiveRecord::Migration
  def self.up
    create_table :d_thread_ratings do |t|
      t.integer :d_thread_id
      t.integer :likes
      t.string :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :d_thread_ratings
  end
end
