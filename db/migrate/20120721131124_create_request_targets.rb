class CreateRequestTargets < ActiveRecord::Migration
  def change
    create_table :request_targets do |t|
      t.belongs_to :request, :null => false
      t.belongs_to :target, :null => false
      t.timestamps
    end
    add_index :request_targets, [:target_id, :request_id], :unique => true
  end
end
