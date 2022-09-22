STATS_COUNT = 4
#File to keep track of a few stats across playthroughs.
class Stats
  attr_accessor :sets_found, :sets_attempted, :resets_used
  def initialize(sets_found, sets_attempted, resets_used, total_attempts)
    @sets_found = sets_found
    @sets_attempted = sets_attempted
    @resets_used = resets_used
    @total_attempts = total_attempts
    if File.exists?("stats.txt")
      lines = File.readlines("stats.txt")
      @sets_found += lines[0].to_i
      @sets_attempted += lines[1].to_i
      @resets_used += lines[2].to_i
      @total_attempts += lines[3].to_i
    end
    File.write("stats.txt","#{@sets_found}\n#{@sets_attempted}\n#{@resets_used}\n#{@total_attempts}")
    puts "Total Sets Found: #{@sets_found}"
    puts "Total Sets Attempted: #{@sets_attempted}"
    puts "Total Resets used: #{@resets_used}"
    puts "Total actions made: #{@total_attempts}"
  end
end
