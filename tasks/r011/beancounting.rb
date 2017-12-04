
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
    @total_players = @guess_array.size

    @guess_array.each do |guess|
      current_guess = guess.split(' ')

      @players[current_guess[0]] = Player.new(0, 0)

      current_guess[1].split(',').each do |entry|
        @total_guesses += 1
        entry_array = entry.split(':')

        if @beans[entry_array[0]].to_i + 1 == entry_array[1].to_i || @beans[entry_array[0]].to_i - 1 == entry_array[1].to_i
          @players[current_guess[0]].one_off += 1
        elsif @beans[entry_array[0]].to_i == entry_array[1].to_i
          @players[current_guess[0]].right_on += 1
        end
      end
    end
  end

  def get_reward(player)
    (@total_players * 2.00 / @total_guesses) * (@players[player].one_off + (@players[player].right_on * 2.0))
  end

  def get_reward_list
    reward_list = ''

    @guess_array.each do |guess|
      current_player = guess.split(' ')[0]

      if get_reward(current_player) != 0
        reward_list << "#{current_player} #{get_reward(current_player)}\n"
      end
    end

    reward_list
  end
end
