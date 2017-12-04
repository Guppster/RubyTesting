
Player = Struct.new(:one_off, :right_on)

# Handles bean counting operations
class BeanCounting
  attr_reader :players

  def initialize(beans)
    @raw_beans = beans
    @total_guesses = 0
    @total_players = 0
    @players = {}
    process_raw_beans
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

      @players[current_guess[0]] = Player.new(0, 0)

      current_guess[1].split(',').each do |entry|
        entry_array = entry.split(':')

        if @beans[entry_array[0]] + 1 == entry_array[1] || @beans[entry_array[0]] - 1 == entry_array[1]
          @players[current_guess[0]].one_off += 1
        elsif @beans[entry_array[0]] == entry_array[1]
          @players[current_guess[0]].right_on += 1
        end
      end
    end
  end

  def get_reward(player)

  end

  def get_reward_list
  end
end
