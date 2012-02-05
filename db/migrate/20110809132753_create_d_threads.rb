class CreateDThreads < ActiveRecord::Migration
  def self.up
    create_table :d_threads do |t|
			t.string :title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :d_threads
  end
end
