#Player class is primarily used to keep track of the number of sets found.
# It keeps track of the name and the number of sets.
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
