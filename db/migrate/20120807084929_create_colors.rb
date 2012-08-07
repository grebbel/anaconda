class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name, :length => 50, :null => false
      t.string :hex, :length => 6, :null => false
      t.integer :red, :null => false
      t.integer :green, :null => false
      t.integer :blue, :null => false
      t.float :luminance, :null => false
      t.timestamps :null => true      
    end
  end
end
