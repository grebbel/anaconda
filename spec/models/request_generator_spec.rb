require 'spec_helper'

describe RequestGenerator do
  
  it { should respond_to :count }
  
  it { should respond_to :max_days }
  
  it { should respond_to :min_targets }

  it { should respond_to :max_targets }
  
  it { should respond_to :assign_to_current_user }

  describe "validation" do
    
    subject { RequestGenerator.new }
    
    it "accepts new instances" do
      subject.should be_valid
    end
    
    it "rejects counts less than 1" do
      subject.count = 0
      subject.should be_invalid
    end
    
    it "rejects max_days less than 1" do
      subject.max_days = 0
      subject.should be_invalid
    end

    it "rejects min_targets less than 1" do
      subject.min_targets = 0
      subject.should be_invalid
    end

    it "rejects max_targets less than 1" do
      subject.max_targets = 0
      subject.should be_invalid
    end

  end
  
  it "should generate the specified number of requests" do
    generator = RequestGenerator.new(:count => 3)
    requests = generator.generate_requests
    requests.count.should equal generator.count
  end
  
  
end
