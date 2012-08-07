class AlterTargets < ActiveRecord::Migration
  def change
    add_column :targets, :type_id, :string, :length => 10
  end
end
