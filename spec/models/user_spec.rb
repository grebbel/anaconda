require 'spec_helper'

describe User do
  
  it { should respond_to :first_name }
  
  it { should respond_to :prefix }
  
  it { should respond_to :last_name }
  
  it { should respond_to :display_name }
      
end
