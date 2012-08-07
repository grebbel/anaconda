class AssayTarget < ActiveRecord::Base

  belongs_to :assay
  belongs_to :target
  attr_accessible :target_id, :assay_id, :treshold

  validates :assay_id, :presence => true
  validates :target_id, :presence => true
  validates :treshold, :presence => true, :numericality => { :minimum => 0.01 }  

end
