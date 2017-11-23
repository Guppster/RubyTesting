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
    output = FakeIO.each_input(["5"]) { @nim.start_game }
    output.should == "line1\nline2\nline3\n" "Welcome to NIM!\n1: [1, 3, 5, 7]\n2: [4, 3, 7]\nSelect board configuration (1 or 2): \nInvalid Selection! Select between 1 and 2: "
  end
end
