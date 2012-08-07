class CreateTargetTypes < ActiveRecord::Migration
  def change
    create_table :target_types do |t|
      t.string :name, :length => 50, :null => false
      t.string :description, :length => 255
      t.timestamps
    end
  end
end
