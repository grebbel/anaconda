class AlterRequestTarget < ActiveRecord::Migration
  def change
    add_column :request_targets, :assay_id, :integer
  end
end
