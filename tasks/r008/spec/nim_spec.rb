require 'spec_helper'
require 'nim'
require 'fake_io'

describe Nim do
  before(:each) do
    @nim = Nim.new(Player.new)
    # player is smart computer player by default
  end

  # after smart computer makes the move, check_kernel_state should return true
  it 'returns true in check_kernel_state after smart computer makes a move' do
    @nim.computerMakeMove
    board = @nim.board
    expect(@nim.object.check_kernel_state(board))
  end

  # Test kernel state of different board configurations
  it 'kernal state false when checked with [1,4,5,7]' do
    expect(@nim.object.check_kernel_state([1, 4, 5, 7])).to eq false
  end

  it 'kernal state true when checked with [1,3,5,7]' do
    expect(@nim.object.check_kernel_state([1, 3, 5, 7])).to eq true
  end

  it 'kernal state true when checked with [4,3,7]' do
    expect(@nim.object.check_kernel_state([4, 3, 7])).to eq true
  end

  it 'produces output to stdout when starting game' do
    output = FakeIO.each_input(%w[5 2 6 1]) { @nim.start_game }
    output.should == "Welcome to NIM!\n" \
      "1: [1, 3, 5, 7]\n" \
      "2: [4, 3, 7]\n" \
      "Select board configuration (1 or 2): \n" \
      "Invalid Selection! Select between 1 and 2: \n" \
      "1: computer_player_smart\n" \
      "2: computer_player_dumb\n" \
      "Select computer player (1 or 2): \n" \
      'Invalid Selection! Select between 1 and 2: '
  end

  it 'produces output to stdout when human player makes move' do
    @nim.autoConfigBoard
    output = FakeIO.each_input(%w[0 1 2 0 1]) { @nim.humanMakeMove }
    output.should == "Select the row(1-4): " \
      "Invalid row. Select valid row: " \
      "Select the number of sticks (1): " \
      "Invalid number of sticks. Select a valid number of sticks (1-1): " \
      "Invalid number of sticks. Select a valid number of sticks (1-1): \n"
  end
end
