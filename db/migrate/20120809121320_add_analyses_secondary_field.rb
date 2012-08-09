class AddAnalysesSecondaryField < ActiveRecord::Migration
  def change
    add_column :analyses, :secondary, :boolean, :default => false
  end
end
