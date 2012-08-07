class TargetType < ActiveRecord::Base
  default_scope :order => :name
  attr_accessible :name, :description
end
