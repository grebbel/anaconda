require 'spec_helper'

describe Assay do
  
  it { should respond_to :name }
  
  context "in initial state" do    
    
    it { should be_invalid }
    
  end
  
  describe "validation" do
    
    it "rejects blank names" do
      Tag.new({:name => ""}).should be_invalid
    end
    
    it "accepts non-blank names" do
      Tag.new({:name => "Tag"}).should be_valid
    end

    it "rejects duplicate names" do
      Tag.create!({:name => "Tag"})
      Tag.new({:name => "Tag"}).should be_invalid
    end
    
  end
  
end
