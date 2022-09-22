#Cards are the fundamental part of the game. They consist of the 4 main traits
# of cards in the actual game. These traits are color,symbol,shading, and count.
class Card
  attr_accessor :color, :symbol, :shading, :count
  #require a creation of a card with all 4 traits or it does not make sense.
  def initialize(color, shape, shading, count)
    @color = color
    @shape = shape
    @shading = shading
    @count = count
  end
  #getters.
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
