class ImportDefinition < ActiveRecord::Base
  
  attr_accessible :name, :description, :cycle_column, :rn_column, :delta_rn_column, :starting_row
  
  validates :name, :presence => true, :uniqueness => true
  validates :description, :length => { :maximum => 255 }
  
  default_scope :order => :name
  
end
