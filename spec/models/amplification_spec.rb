require 'spec_helper'

describe Amplification do
  
  it { should respond_to :analysis }
  
  it { should respond_to :cycle }
  
  it { should respond_to :rn }
  
  it { should respond_to :delta_rn }
  
  describe "validation" do
    
    subject { Amplification.new(:analysis_id => 1, :cycle => 1, :rn => 0.1, :delta_rn => 0.1) }
    
    it "is valid" do
      subject.should be_valid
    end
    
    it "should belong to an analysis" do
      subject.analysis = nil
      subject.should be_invalid
    end
    
    it "rejects a cycle less than 1" do
      subject.cycle = 0
      subject.should be_invalid
    end
    
    it "rejects an empty rn" do
      subject.rn = nil
      subject.should be_invalid
    end
    
    it "rejects an empty delta_rn" do
      subject.delta_rn = nil
      subject.should be_invalid
    end

  end
  
end
