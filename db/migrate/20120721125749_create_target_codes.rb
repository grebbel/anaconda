class CreateTargetCodes < ActiveRecord::Migration
  def change
    create_table :target_codes do |t|
      t.belongs_to :target, :null => false
      t.string :code, :limit => 50, :null => false
      t.timestamps
    end
    add_index :target_codes, :code, :unique => true    
  end
end
