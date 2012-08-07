class AlterAmplifications < ActiveRecord::Migration
  
  def up
    add_column :amplifications, :id, :primary_key
  end

  def down
    remove_column :amplifications, :id
  end
  
end
