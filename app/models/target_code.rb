class TargetCode < ActiveRecord::Base
  belongs_to :target
  attr_accessible :code
  validates :code, :presence => true, :uniqueness => {:case_sensitive => false}
end
