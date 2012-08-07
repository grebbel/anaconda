require 'spec_helper'

describe AmplificationGenerator do
  
  it { should respond_to :cycles }
  
  describe "validation" do
    
    subject { AmplificationGenerator.new }
    
    it 'accepts valid instances' do
      subject.should be_valid      
    end
    
    it 'rejects cycles less than 1' do
      subject.cycles = 0
      subject.should be_invalid
    end
    
  end
  
  describe 'generate_amplifications' do
    
    subject { AmplificationGenerator.new }

    it 'generates the expected number of amplifications' do
      subject.cycles = 10
      amplifications =  subject.generate_amplifications
      amplifications.count.should equal subject.cycles
    end
    
  end
  
end
