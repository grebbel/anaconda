class CreateImportDefinitions < ActiveRecord::Migration
  def change
    create_table :import_definitions do |t|
      t.string :name, :length => 50
      t.string :description, :length => 255
      t.integer :cycle_column
      t.integer :rn_column
      t.integer :delta_rn_column
      t.integer :starting_row      
      t.timestamps
    end
  end
end
