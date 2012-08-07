require 'spec_helper'

describe Target do

  it { should respond_to :name }
  
  it { should respond_to :description }
  
  it { should respond_to :target_tags }
  
  it { should respond_to :tags }
  
  it { should respond_to :assay_targets }
  
  it { should respond_to :assays }

  it { should respond_to :type }
  
  it { should respond_to :color }
  
  context "in initial state" do    
    
    it { should be_invalid }
    
  end
  
  describe "validation" do
    
    it "accepts valid names" do
      Target.new(:name => "Target").should be_valid
    end

    it "rejects blank names" do
      Target.new(:name => "").should be_invalid
    end
    
    it "rejects duplicate names" do
      Target.create!(:name => "Target")
      Target.new(:name => "Target").should be_invalid
    end
    
  end
  
  describe "tags" do
    
    subject { Target.create!(:name => "Target") }
    
    it { should respond_to :tags }

    before :each do
      @tag1 = Tag.create!(:name => "Tag 1")
      @tag2 = Tag.create!(:name => "Tag 2")
    end
    
    it "can be assigned multiple times" do
      expect { subject.tags << [@tag1, @tag2] }.to_not raise_error
    end

    it "cannot be assigned duplicates" do
      expect { subject.tags << [@tag1, @tag1] }.to raise_error
    end
    
    it "can be looked up reversely" do
      subject.tags << @tag1
      @tag1.targets.should include subject
    end

  end
  
  describe "codes" do
    
    it { should respond_to :codes }

    subject { Target.create!(:name => "Target") }
    
    it "can be assigned multiple times" do
      expect { subject.codes << [TargetCode.new(:code => "code1"), TargetCode.new(:code => "code2")] }.to_not raise_error
    end
    
    it "cannot be assigned duplicates" do
      subject.codes << [TargetCode.new(:code => "code1"), TargetCode.new(:code => "CODE1")]
      subject.should be_invalid
    end
    
  end
    
end
