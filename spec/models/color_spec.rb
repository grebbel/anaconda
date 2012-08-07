require 'spec_helper'

describe Color do
  
  it { should respond_to :name }

  it { should respond_to :hex }

  it { should respond_to :red }

  it { should respond_to :green }

  it { should respond_to :blue }
  
  it { should respond_to :luminance }

end
