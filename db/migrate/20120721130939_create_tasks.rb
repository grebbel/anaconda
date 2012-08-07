class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, :limit => 255, :null => false
      t.boolean :completed, :default => false, :null => false
      t.integer :assignee # belongs_to :user
      t.string :entity, :limit => 50
      t.integer :entity_id
      t.timestamps
    end
  end
end
