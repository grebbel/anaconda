class AnalysisSet
  
  include ActiveAttr::Model
  
  attr_accessible :analyses
  
  def initialize(analyses)
    @analyses = analyses
  end
  
end