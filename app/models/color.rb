class Color < ActiveRecord::Base
  attr_accessible :name, :hex, :red, :green, :blue, :luminance
  
  default_scope where('luminance <= ?', 200).order(:name)
end
