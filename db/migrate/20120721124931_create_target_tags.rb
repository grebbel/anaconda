class CreateTargetTags < ActiveRecord::Migration
  def change
    create_table :target_tags do |t|
      t.belongs_to :tag, :null => false
      t.belongs_to :target, :null => false      
      t.timestamps
    end
    add_index :target_tags, [:tag_id, :target_id], :unique => true
  end
end
