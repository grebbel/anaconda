class DropRequestTargets < ActiveRecord::Migration
  
  def up
    drop_table :request_targets
  end

  def down
    create_table :request_targets do |t|
      t.belongs_to :request, :null => false
      t.belongs_to :target, :null => false
      t.belongs_to :assay_id
      t.timestamps :null => true
    end
  end
  
end
