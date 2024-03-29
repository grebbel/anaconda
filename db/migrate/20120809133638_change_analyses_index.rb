class ChangeAnalysesIndex < ActiveRecord::Migration
  def up
    # See: http://www.eimermusic.com/code/rails-migration-of-indexes/
    change_table :analyses do |t|
      begin
        t.remove_index :name => 'index_analyses_on_target_id_and_request_id'
      rescue
      end
    end
    add_index :analyses, [:target_id, :request_id, :assay_id], :unique => false
  end

  def down
    change_table :analyses do |t|
      t.remove_index :name => 'index_analyses_on_target_id_and_request_id_and_assay_id'
    end
  end
end
