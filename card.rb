class Card
  attr_accessor :color, :symbol, :shading, :count

  def initialize(color, shape, shading, count)
    @color = color
    @shape = shape
    @shading = shading
    @count = count
  end
  def color
    @color
  end
  def shape
    @shape
  end
  def shading
    @shading
  end
  def count
    @count
  end
end
