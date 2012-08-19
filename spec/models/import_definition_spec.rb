require 'spec_helper'

describe ImportDefinition do
  
  it { should respond_to :name }

  it { should respond_to :description }
  
  it { should respond_to :sheet_name }

  it { should respond_to :starting_row }

  it { should respond_to :max_rows }

  it { should respond_to :cycle_column }
  
  it { should respond_to :rn_column }

  it { should respond_to :delta_rn_column }

  
  describe "validation" do
    
    subject { ImportDefinition.create(:name => 'Example') }
    
    it { should be_valid }
    
    it "should reject blank names" do
      subject.name = ''
      subject.should be_invalid
    end
    
    it "should reject duplicate names" do
      duplicate = ImportDefinition.new(:name => subject.name)
      duplicate.should be_invalid
    end
    
    it "should reject descriptions longer than 255 characters" do
      subject.description = 'A' * 256
      subject.should be_invalid
    end
    
  end

end
