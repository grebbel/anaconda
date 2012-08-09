class CtCalculation
  
  include ActiveAttr::Model

  attribute :analysis_id, :type => Integer
  attribute :treshold, :type => Float
  attribute :ct, :type => Float
  
end