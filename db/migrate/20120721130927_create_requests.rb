class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :external_id, :limit => 50, :null => false
      t.string :description, :limit => 100, :null => false
      t.datetime :due_date, :null => false
      t.timestamps :null => true
    end
  end
end
