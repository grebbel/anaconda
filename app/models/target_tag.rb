class TargetTag < ActiveRecord::Base
  
  belongs_to :tag
  belongs_to :target
  
end
