NUMBER_OF_ACTIVE_CARDS = 12
SET_SIZE = 3
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
class Remaining_Cards
  #All Possible Values to fill in all cards as remaining at the beginning
  # of the game.
  def initialize
    @cards_left = []
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
      end
    end
    @cards_left.shuffle
  end

  attr_accessor :cards_left
end
class Game
  def initialize
    @active_cards = []
    deck = Remaining_Cards.new
    NUMBER_OF_ACTIVE_CARDS.times do |i|
      card = deck.cards_left.pop
      @active_cards << card
    end
    print_active_cards
    @active_cards = @active_cards.shuffle
    active_game = true
    while active_game
      print_active_cards
      puts "Enter s if you found a set otherwise enter n for 3 new cards"
      set_or_not = gets.chomp
      if set_or_not.downcase == "s"
        puts "Enter the 3 cards for a set as shown next to the card. These should be seperated by new lines."
        card_set1 = gets.chomp
        card_set2 = gets.chomp
        card_set3 = gets.chomp
        if set?(@active_cards[card_set1.to_i],@active_cards[card_set2.to_i],@active_cards[card_set3.to_i])
          puts "congrats a set has been found!"
        else
          puts "This is not a set try again!"
        end
      end
    end
  end
  def set?(card1,card2,card3)
    if !(((card1.color == card2.color) && (card2.color == card3.color)) || ((card1.color != card2.color) && (card1.color != card3.color) && (card2.color != card3.color)))
      return false
    end
    if !(((card1.shape == card2.shape) && (card2.shape == card3.shape)) || ((card1.shape != card2.shape) && (card1.shape != card3.shape) && (card2.shape != card3.shape)))
      return false
    end
    if !(((card1.shading == card2.shading) && (card2.shading == card3.shading)) || ((card1.shading != card2.shading) && (card1.shading != card3.shading) && (card2.shading != card3.shading)))
      return false
    end
    if !(((card1.count == card2.count) && (card2.count == card3.count)) || ((card1.count != card2.count) && (card1.count != card3.count) && (card2.count != card3.count)))
      return false
    end
    return true
  end
  def replace_active_cards(card1_index,card2_index,card3_index, deck)
    @active_cards.delete_at(card1_index)
    @active_cards.delete_at(card2_index)
    @active_cards.delete_at(card3_index)
    SET_SIZE.times do
      card = deck.cards_left.pop
      @active_cards << card
    end
    print_active_cards
  end
  def print_active_cards
    NUMBER_OF_ACTIVE_CARDS.times do |i|
      card = @active_cards.at(i)
      puts "#{i}. color = #{card.color}, shape = #{card.shape}, shading = #{card.shading}, count = #{card.count}"
    end
  end
end


Game.new








