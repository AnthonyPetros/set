require_relative 'player.rb'
require_relative 'remaining_cards.rb'
#Game is where all of the game logic resides. It creates a fresh deck of cards and players.
# It then requests that a user finds a set, or if they fail to find a set they can request 3 new cards
# after quitting, or running out of cards to fill a board the game then displays a winner.
class Game
  def initialize
    #Get a set of cards to display on the board.
    @active_cards = []
    deck = Remaining_Cards.new
    NUMBER_OF_ACTIVE_CARDS.times do
      card = deck.cards_left.pop
      @active_cards << card
    end
    #Intial variables needed to get game running
    active_game = true
    #Create players and store them in an array, to support a larger than 2 person game
    valid_players = true
    players = []
    #force the user to enter some players
    while valid_players
      puts "How many players should be in the game (Select 2-4)"
      num_players = gets.chomp
      #if the entered number falls within range
      if num_players.to_i <= 4 && num_players.to_i >=2
        valid_players = false
        num_players.to_i.times do|i|
          #player name can be any string so not misaligned behavior can happen here
          puts "Enter a name of a Player"
          player_name = gets.chomp
          players << Player.new(player_name)
          puts"#{player_name} is Player#{i+1}"
        end
      else
        #If the user inputs something other than 2-4 inclusive.
        puts "Select a number 2-4."
      end
    end
    #While the player still wants to play and the board can be added too
    while active_game and deck.cards_left.length > 0
      #Let the user know how many cards are left in the deck
      puts "There are #{deck.cards_left.length} cards remaining"
      #display the cards
      print_active_cards
      puts "Enter s if you found a set otherwise enter n for 3 new cards or q to quit game and display stats"
      set_or_not = gets.chomp
      #have the user select the next action
      if set_or_not.downcase == "s"
        #if they think they have found a set, get the 3 cards
        puts "Enter the 3 cards for a set as shown next to the card. These should be seperated by new lines."
        card_set1 = gets.chomp
        card_set2 = gets.chomp
        card_set3 = gets.chomp
        #check if set
        if set?(@active_cards[card_set1.to_i],@active_cards[card_set2.to_i],@active_cards[card_set3.to_i])
          puts "congrats a set has been found!"
          valid_player_found = false
          while !valid_player_found
            #have the user input a valid user so the set can be tracked
            puts "Which player# entered the set?"
            set_finder = gets.chomp
            #decrement 1 cause player 0 sounds weird
            if set_finder.to_i >= 1 && set_finder.to_i <= num_players.to_i
              players[set_finder.to_i - 1].inc_num_sets
              valid_player_found = true
            else
              puts "Enter a valid player"
            end
          end
          replace_active_cards(card_set1.to_i,card_set2.to_i,card_set3.to_i,deck)
        else
          #if the user entered invalid sets
          puts "This is not a set try again!"
        end
        #if the user needs new cards
      elsif set_or_not.downcase == "n"
        puts "Enter the 3 cards you want replaced"
        card_set1 = gets.chomp
        card_set2 = gets.chomp
        card_set3 = gets.chomp
        #get new cards
        replace_active_cards(card_set1.to_i,card_set2.to_i,card_set3.to_i,deck)
        #quit game and determine the winner.
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
        puts "Enter a valid value"
      end

    end
  end
  def set?(card1,card2,card3)
    #if each attribute either all matches or are all different
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
    #update the deck when cards need removed
    @active_cards.delete_at(card1_index)
    @active_cards.delete_at(card2_index)
    @active_cards.delete_at(card3_index)
    SET_SIZE.times do#get new cards
      card = deck.cards_left.pop
      @active_cards << card
    end
  end
  def print_active_cards
    #print all the cards and attributes
    NUMBER_OF_ACTIVE_CARDS.times do |i|
      card = @active_cards.at(i)
      puts "#{i}. color = #{card.color}, shape = #{card.shape}, shading = #{card.shading}, count = #{card.count}"
    end
  end
end

