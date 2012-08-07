class AlterRequests < ActiveRecord::Migration
  
  def change
    rename_column :requests, :external_id, :identifier
  end
  
end
