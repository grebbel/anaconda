require 'spec_helper'

describe Analysis do
  
  it { should respond_to :request }
  
  it { should respond_to :target }

  it { should respond_to :assay }
  
  it { should respond_to :ct }
  
  it { should respond_to :treshold }
  
  it { should respond_to :status }
  
end
