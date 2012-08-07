require 'spec_helper'

describe Task do
  
  it { should respond_to :description }
  
  it { should respond_to :completed }
  
  it { should respond_to :assignee }
  
  it { should respond_to :request }

  describe "validation" do
    
    subject { Task.new(:description => "TODO", :completed => false, :assignee => User.new(:email => 'user@server.com'))}
    
    it "accepts a valid instance" do
      subject.should be_valid
    end
    
    it "rejects a blank description" do
      subject.description = ""
      subject.should_not be_valid
    end
    
    it "rejects a description longer than 255 characters" do
      subject.description = "a" * 256
      subject.should_not be_valid
    end

    it "accepts a nil assignee" do
      subject.assignee = nil
      subject.should be_valid
    end 

  end
  
end
