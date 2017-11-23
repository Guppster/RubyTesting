require 'spec_helper'

describe Nim do
  subject { Nim }

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
end

