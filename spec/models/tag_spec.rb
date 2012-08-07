require 'spec_helper'

describe Tag do
  
  it { should respond_to :name }
  
  it { should respond_to :category }
  
  it { should respond_to :description }

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
    
    it "rejects names longer than 50 characters" do
      Tag.new(:name => "a" * 51).should be_invalid
    end
    
    it "accepts names up to 50 characters long" do
      Tag.new(:name => "a" * 50).should be_valid
    end

    it "rejects names longer than 50 characters" do
      Tag.new(:name => "a" * 51).should be_invalid
    end
    
    it "accepts categories up to 50 characters long" do
      Tag.new(:name => "a", :category => "a" * 50).should be_valid
    end

    it "rejects categories longer than 50 characters" do
      Tag.new(:name => "a", :category => "a" * 51).should be_invalid
    end
    
    it "accepts descriptions up to 255 characters long" do
      Tag.new(:name => "a", :description => "a" * 255).should be_valid
    end
    
    it "rejects descriptions longer than 255 characters" do
      Tag.new(:name => "a", :description => "a" * 256).should be_invalid
    end

  end  
  
end
