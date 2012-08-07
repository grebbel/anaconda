class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, :limit => 50, :null => false
      t.string :category, :limit => 50
      t.string :description, :limit => 255
      t.timestamps :null => true
    end
    add_index :tags, :name, :unique => true
  end
end
