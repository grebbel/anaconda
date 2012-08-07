class AddAnalysesIndex < ActiveRecord::Migration
  
  def change
    add_index :analyses, [:target_id, :request_id], :unique => true
  end
  
end
