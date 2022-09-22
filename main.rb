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
class Player
  attr_accessor :name, :num_sets, :num_attempts
  def initialize(name)
    @name = name
    @num_sets = 0
    @num_attempts = 0
  end
  def name
    @name
  end
  def num_sets
    @num_sets
  end
  def num_attempt
    @num_attempts
  end
  def inc_num_sets
    @num_sets = @num_sets + 1
  end
  def inc_num_attempts
    @num_attempts = @num_attempts +1
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

  end

  attr_accessor :cards_left
end

class Game
  def initialize
    @active_cards = []
    deck = Remaining_Cards.new
    NUMBER_OF_ACTIVE_CARDS.times do
      card = deck.cards_left.pop
      @active_cards << card
    end
    active_game = true
    valid_players = true
    players = []
    while valid_players
      puts "How many players should be in the game (Select 2-4)"
      num_players = gets.chomp
      if num_players.to_i <= 4 && num_players.to_i >=2
        valid_players = false
        num_players.to_i.times do|i|
          puts "Enter a name of a Player"
          player_name = gets.chomp
          players << Player.new(player_name)
          puts"#{player_name} is Player#{i+1}"
        end
      else
        puts "Select a number 2-4."
      end
    end
    while active_game and deck.cards_left.length > 0

      print_active_cards
      puts "Enter s if you found a set otherwise enter n for 3 new cards or q to quit game and display stats"
      set_or_not = gets.chomp
      if set_or_not.downcase == "s"
        puts "Enter the 3 cards for a set as shown next to the card. These should be seperated by new lines."
        card_set1 = gets.chomp
        card_set2 = gets.chomp
        card_set3 = gets.chomp
        if set?(@active_cards[card_set1.to_i],@active_cards[card_set2.to_i],@active_cards[card_set3.to_i])
          puts "congrats a set has been found!"
          valid_player_found = false
          while !valid_player_found
          puts "Which player# entered the set?"
          set_finder = gets.chomp
          if set_finder.to_i >= 1 && set_finder.to_i <= num_players.to_i
            players[set_finder.to_i - 1].inc_num_sets
            valid_player_found = true
          else
            puts "Enter a valid player"
          end
          end
          replace_active_cards(card_set1.to_i,card_set2.to_i,card_set3.to_i,deck)
        else
          puts "This is not a set try again!"
        end
      elsif set_or_not.downcase == "n"
        puts "Enter the 3 cards you want replaced"
        card_set1 = gets.chomp
        card_set2 = gets.chomp
        card_set3 = gets.chomp
        replace_active_cards(card_set1.to_i,card_set2.to_i,card_set3.to_i,deck)
      elsif set_or_not.downcase == "q"
        active_game = false
        greatest = 0
        player_with_most_sets = ""
        players.length.times do |i|
          puts "#{players[i].name} found #{players[i].num_sets} sets"
          curr_set = players[i].num_sets

          if curr_set > greatest
            player_with_most_sets = i

          end
        end
        puts"#{players[player_with_most_sets].name} had the most sets!"
      else
        puts "enter a proper value"
      end

    end
  end
  def set?(card1,card2,card3)
    if !(((card1.color == card2.color) and (card2.color == card3.color)) or ((card1.color != card2.color) and (card1.color != card3.color) and (card2.color != card3.color)))
      return false
    end
    if !(((card1.shape == card2.shape) and (card2.shape == card3.shape)) or ((card1.shape != card2.shape) and (card1.shape != card3.shape) and (card2.shape != card3.shape)))
      return false
    end
    if !(((card1.shading == card2.shading) and (card2.shading == card3.shading)) or ((card1.shading != card2.shading) and (card1.shading != card3.shading) and (card2.shading != card3.shading)))
      return false
    end
    if !(((card1.count == card2.count) and (card2.count == card3.count)) or ((card1.count != card2.count) and (card1.count != card3.count) and (card2.count != card3.count)))
      return false
    end
    true
  end
  def replace_active_cards(card1_index,card2_index,card3_index, deck)
    @active_cards.delete_at(card1_index)
    @active_cards.delete_at(card2_index)
    @active_cards.delete_at(card3_index)
    SET_SIZE.times do
      card = deck.cards_left.pop
      @active_cards << card
    end
  end
  def print_active_cards
    NUMBER_OF_ACTIVE_CARDS.times do |i|
      card = @active_cards.at(i)
      puts "#{i}. color = #{card.color}, shape = #{card.shape}, shading = #{card.shading}, count = #{card.count}"
    end
  end
end


Game.new








