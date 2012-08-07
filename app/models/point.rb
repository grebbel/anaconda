class Point
  
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = Float(x)
    @y = Float(y)
  end
  
  def to_s
    "#{x},#{y}"
  end
  
end