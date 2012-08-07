class AmplificationGenerator
  include ActiveAttr::Model
  include Math
  
  attribute :cycles, :type => Integer, :default => 45
  
  validates :cycles, :presence => true, :numericality => { :greater_than => 0 }

  def generate_amplifications        
    # =(RANDBETWEEN(5;10)*-0,1)
    e2 = (5 + (rand() * 5)) * -0.1
    # =RAND()
    f2 = rand()
    # =RANDBETWEEN(80;120)*0,03
    g2 = (80 + rand() * 40) * 0.03
    # =RAND()*4
    h2 = rand() * 10

    values = [ ]
    cycles.times do |i|
      # Original formula
      # F2*SIN(B3/6)*(E2+(LN((B3*H2)-F2)/G2))
      cycle = i + 1
      b3 = cycle
      l = (b3*h2)
      l = 0.01 if l < 0 # Prevent log(0)
      value = f2 * sin(b3 / 6.0) * (e2 + ((log(l)-f2)/g2))
      values << value
    end 
    values
  end
  
  
end