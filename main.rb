game = true
while game
    puts "The game shall continue"

    input = gets.chomp
    puts "hello #{input}"
    if input == "q"then
      game = false
    end
  end
class Card
  attr_accessor :color, :symbol, :shading, :count

  def initialize(color, shape, shading, count)
    @color = color
    @shape = shape
    @shading = shading
    @count = count
  end


end
class Remaining_Cards
  #All Possible Values to fill in all cards as remaining at the beginning
  # of the game.
  color = %w[red green purple]
  shape = %w[diamond squiggle oval]
  shading = %w[solid, clear, striped]
  count = [1,2,3]
  def initialize
    @cards_left = []
    i = 0, j=0, k=0,l=0
    while i<count.length
      while j<shading.length
        while k<shape.length
          while l <color.length
            @cards_left[i+j+k+l] = Card.new(color[l],shape[k],shading[j],count[i])
            l+= 1
          end
          l=0
          k+=1
        end
        k=0
        j+=1
      end
      j=0
      i+=1
    end
  end
  @size = @cards_left.length
  attr_reader :size
  attr_accessor :cards_left
end