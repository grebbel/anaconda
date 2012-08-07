class Assay < ActiveRecord::Base
  
  has_many :assay_targets
  has_many :targets, :through => :assay_targets, :order => :name
  
  attr_accessible :name, :description, :assay_targets_attributes
  accepts_nested_attributes_for :assay_targets, :reject_if => lambda { |at| at[:target_id].blank? }, :allow_destroy => true  
  
  validates :name, :presence => true, :uniqueness => true

  default_scope :order => :name
  
end
