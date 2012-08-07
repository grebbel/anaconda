class CreateAmplifications < ActiveRecord::Migration
  def change
    create_table :amplifications, :id => false do |t|
      t.belongs_to :analysis
      t.integer :cycle, :null => false
      t.float :rn, :null => false
      t.float :delta_rn, :null => false
      t.timestamps :null => true
    end
  end
end
