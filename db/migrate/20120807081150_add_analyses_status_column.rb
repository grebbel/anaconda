class AddAnalysesStatusColumn < ActiveRecord::Migration
  
  def change
    add_column :analyses, :status, :string, :length => 50
  end
  
end
