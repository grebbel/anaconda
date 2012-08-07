class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.belongs_to :request, :null => false
      t.belongs_to :target
      t.belongs_to :assay
      t.float :ct
      t.float :treshold
      t.timestamps
    end
  end
end
