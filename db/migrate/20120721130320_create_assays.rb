class CreateAssays < ActiveRecord::Migration
  def change
    create_table :assays do |t|
      t.string :name, :limit => 50, :null => false
      t.string :description, :limit => 255      
      t.timestamps :null => true
    end
    add_index :assays, :name, :unique => true
  end
end
