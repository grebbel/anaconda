require 'spec_helper'

describe Request do
  
  it { should respond_to :due_date }
  
  it { should respond_to :identifier }
  
  it { should respond_to :description }
  
  it { should respond_to :analyses }

  it { should respond_to :targets }
  
  it { should respond_to :tasks }

  it { should respond_to :state }

  def example_request
    target = Target.create!(:name => 'Target')    
    Request.create!(:due_date => Time.now, :identifier => "12345", :description => "Description", :target_ids => [ target.id ])
  end
  
  describe "validation" do

    subject { example_request }

    it "accepts a valid instance" do
      subject.should be_valid
    end

    it "rejects a blank due_date" do
      subject.due_date = nil
      subject.should be_invalid
    end

    it "rejects a blank identifier" do
      subject.identifier = ''
      subject.should be_invalid
    end

    it "rejects an identifier longer than 50 characters" do
      subject.identifier = "a" * 51
      subject.should be_invalid
    end

    it "rejects a blank description" do
      subject.description = ''
      subject.should be_invalid
    end

    it "rejects a description longer than 100 characters" do
      subject.description = 'a' * 101
      subject.should be_invalid
    end
    
    it "rejects a blank state" do
      subject.state = ''
      subject.should be_invalid
    end
    
    it "rejects a state longer than 50 characters" do
      subject.state = 'a' * 51
      subject.should be_invalid
    end
    
  end
  
  describe 'associations' do
    
    subject { example_request }
    
    it 'manages analyses automatically' do
      expect { subject.save }.to change(Analysis, :count).by 1
      expect { subject.destroy }.to change(Analysis, :count).by -1
    end
    
  end

  describe "states" do
    
    def first_open_task
      subject.tasks.uncompleted.first
    end

    context "initially" do

      subject { example_request }

      it "is initialized in the 'pending' state" do
        subject.state.to_sym.should equal :pending
      end
    
      it "transitions to the 'review' state when calling 'start'" do
        subject.start
        subject.state.to_sym.should equal :review
      end
      
    end

    context "in the 'review' state" do
      
      subject { example_request }
      
      before :each do
        subject.start
      end

      it "has an open 'review_request' task" do
        first_open_task.description.to_sym.should equal :review_request
      end

      it "transitions to the 'prepare' state when calling 'accept'" do
        subject.accept
        subject.state.to_sym.should equal :prepare
        subject.tasks.uncompleted.should_not be_empty
      end
      
      it "transitions to the 'rejected' state when calling 'reject'" do
        subject.reject 
        subject.state.to_sym.should equal :rejected
        subject.tasks.uncompleted.should be_empty
      end

    end
    
    context "in the 'prepare' state" do

      subject { example_request }

      before :each do
        subject.start
        subject.accept
      end

      it "has an open 'prepare_request' task" do
        first_open_task.description.to_sym.should equal :prepare_request
      end
      
      it "transitions to the 'analyse' state when calling 'prepared'" do
        subject.prepared
        subject.state.to_sym.should equal :analyse
      end

    end


  end

end
