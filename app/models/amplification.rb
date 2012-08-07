class Amplification < ActiveRecord::Base
  belongs_to :analysis
  attr_accessible :analysis_id, :cycle, :rn, :delta_rn
  
  validates :analysis_id, :presence => true
  validates :cycle, :numericality => { :greater_than_or_equal_to => 1}
  validates :rn, :presence => true
  validates :delta_rn, :presence => true
  
  default_scope order(:analysis_id, :cycle)
  scope :for_analyses, lambda { |*analysis_ids| where(:analysis_id => analysis_ids) }
  
end
