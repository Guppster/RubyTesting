#!/usr/bin/env ruby
require './nim.rb'

# Good
class NimPlayerTester
  def initialize(game)
    @game = game
  end

  def game
    @game
  end
end
run = 0

while run < 20
  auto_nim = NimPlayerTester.new(Nim.new(Player.new, Player.new))
  auto_nim.game.autoConfigBoard
  auto_nim.game.player_choice = 0 # dumb player starts first

  while auto_nim.game.gameOver == false

    auto_nim.game.autoComputerMakeMove

    if auto_nim.game.player_choice.zero?
      puts "Dumb player took #{auto_nim.game.sticks_taken} " \
           "from row #{auto_nim.game.row}"
    else
      puts "Smart player took #{auto_nim.game.sticks_taken} " \
           "from row #{auto_nim.game.row}"
    end

    puts
    auto_nim.game.checkGameOver

    if auto_nim.game.gameOver == true

      if auto_nim.game.player_choice.zero?
        puts 'Dumb player wins!!!'
      else
        puts 'Smart player wins!!!'
      end

    end

    auto_nim.game.player_choice = ((auto_nim.game.player_choice + 1) % 2)
  end

  run += 1
  puts
end

puts 'Thanks for playing! Good bye!!!'
