class AddTargetsColorField < ActiveRecord::Migration
  
  def change
    add_column :targets, :color_id, :integer
  end

end
