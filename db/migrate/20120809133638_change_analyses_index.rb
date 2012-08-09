class ChangeAnalysesIndex < ActiveRecord::Migration
  def up
    # See: http://www.eimermusic.com/code/rails-migration-of-indexes/
    change_table :analyses do |t|
      t.remove_index :name => 'index_analyses_on_target_id_and_request_id'
    end
    add_index :analyses, [:target_id, :request_id, :assay_id], :unique => true
  end

  def down
    add_index :analyses, [:target_id, :request_id], :unique => true
  end
end
