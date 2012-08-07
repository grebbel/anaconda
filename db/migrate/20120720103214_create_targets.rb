class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name, :limit => 50, :null => false
      t.string :description, :limit => 255
      t.timestamps :null => true
    end
    add_index :targets, :name, :unique => true
  end
end
