require_relative 'card.rb'
class Remaining_Cards
  #All Possible Values to fill in all cards as remaining at the beginning
  # of the game.
  def initialize
    @cards_left = []
    #all possible attributes of cards as described by wiki page
    colors = [:red, :green, :purple]
    shapes = [:diamond, :squiggle, :oval]
    shadings = [:solid, :clear, :striped]
    counts = [:one, :two, :three]
    colors.each do |color|
      shapes.each do |shape|
        shadings.each do |shading|
          counts.each do |count|
            @cards_left << Card.new(color,shape,shading,count)
          end
        end
        @cards_left = @cards_left.shuffle
      end
    end

  end

  attr_accessor :cards_left
end
