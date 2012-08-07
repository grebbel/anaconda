class AlterTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :request_id, :integer, :null => false
    remove_column :tasks, :entity
    remove_column :tasks, :entity_id
  end

end
