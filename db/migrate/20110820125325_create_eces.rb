class CreateEces < ActiveRecord::Migration
  def self.up
    create_table :eces do |t|
      t.string :name
      t.string :description
      t.string :Area
      t.string :Prerequisites
      t.string :Lecturehours
      t.string :Labhours
      t.string :Tutorialhours

      t.timestamps
    end
  end

  def self.down
    drop_table :eces
  end
end
