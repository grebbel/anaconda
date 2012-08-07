class CreateAssayTargets < ActiveRecord::Migration
  def change
    create_table :assay_targets do |t|
      t.belongs_to :assay, :null => false
      t.belongs_to :target, :null => false
      t.float :treshold, :null => false
      t.timestamps
    end
    add_index :assay_targets, [:assay_id, :target_id], :unique => true
  end
end
