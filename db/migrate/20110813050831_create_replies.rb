class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.integer :d_thread_id
      t.string :author
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
