# Handles bean counting operations
class BeanCounting
  def initialize(beans)
    @raw_beans = beans
    @total_guesses = 0
    @total_players = 0
    @players = {}
  end

  def count_beans(type)
    @raw_beans.count(type)
  end

  def process_raw_beans
    @beans =
      Hash[@raw_beans
      .split('')
      .group_by { |char| char }
      .map { |char, count| [char, count.size] }
      .sort_by { |char, count| [-count, char] }]
  end

  def submit_guesses(guesses)
    @guess_array = guesses.split("\n")

    @guess_array.each do |guess|
      current_guess = guess.split(' ')



    end
  end

  def get_reward(player)

  end

  def get_reward_list
  end
end
