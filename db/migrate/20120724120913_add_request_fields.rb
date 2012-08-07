class AddRequestFields < ActiveRecord::Migration
  def change
    add_column :requests, :state, :string, :limit => 50
  end
end
