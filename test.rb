require_relative 'main.rb'
require 'test/unit'
class Testing < Test::Unit::TestCase
  def test_card_construct1
    card1 = Card.new("red","circle","clear","three")
    assert_equal("red",card1.color)
    assert_equal("circle",card1.shape)
    assert_equal("clear",card1.shading)
    assert_equal("three",card1.count)
  end
  def test_card_construct2
    card1 = Card.new("green","squiggle","striped","two")
    assert_equal("green",card1.color)
    assert_equal("squiggle",card1.shape)
    assert_equal("striped",card1.shading)
    assert_equal("two",card1.count)
  end

  def test_remaining_cards_construct
    remain_cards = Remaining_Cards.new
    assert_equal(81,remain_cards.cards_left.length)
  end
  def test_set_all_diff
    card1 = Card.new("green","diamond","solid","one")
    card2 = Card.new("purple","squiggle","clear","two")
    card3 = Card.new("red","oval","striped","three")
    assert_equal(Game.new.set?(card1,card2,card3), true)

  end
  def test_set_some_diff
    card1 = Card.new("red","diamond","solid","one")
    card2 = Card.new("red","squiggle","clear","one")
    card3 = Card.new("red","oval","striped","one")
    assert_equal(Game.new.set?(card1,card2,card3), true)
  end
  def test_set_failed_color
    card1 = Card.new("red","diamond","solid","one")
    card2 = Card.new("purple","squiggle","clear","two")
    card3 = Card.new("red","oval","striped","three")
    assert_equal(Game.new.set?(card1,card2,card3), false)

  end
  def test_set_failed_shape
    card1 = Card.new("green","oval","solid","one")
    card2 = Card.new("purple","squiggle","clear","two")
    card3 = Card.new("red","oval","striped","three")
    assert_equal(Game.new.set?(card1,card2,card3), false)

  end
  def test_set_failed_shading
    card1 = Card.new("green","diamond","solid","one")
    card2 = Card.new("purple","squiggle","striped","two")
    card3 = Card.new("red","oval","striped","three")
    assert_equal(Game.new.set?(card1,card2,card3), false)

  end
  def test_set_failed_count
    card1 = Card.new("green","diamond","solid","three")
    card2 = Card.new("purple","squiggle","clear","two")
    card3 = Card.new("red","oval","striped","three")
    assert_equal(Game.new.set?(card1,card2,card3), false)

  end
  def test_set_multi_failed
    card1 = Card.new("red","diamond","solid","three")
    card2 = Card.new("purple","squiggle","solid","two")
    card3 = Card.new("red","oval","striped","three")
    assert_equal(Game.new.set?(card1,card2,card3), false)

  end
  def player_constructor
    player1 = Player.new("Anthony")
    assert_equal(player1.name,"Anthony")
  end
end
