class InsertTargetTypes < ActiveRecord::Migration
  def up
    execute <<-eos
    INSERT INTO target_types (name) 
    VALUES
      ('MRSA'),
      ('EasyMAG'),
      ('STD')
    ;
    eos
  end

  def down
    execute 'DELETE FROM target_types'    
  end
end
