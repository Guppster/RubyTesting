require 'spec_helper'

describe BeanCounting do
  it 'count beans returns correct amount after initialization' do
    @contest = BeanCounting.new('abcda')

    expect(@contest.count_beans('a')).to eq 2
  end

  it 'raw beans are processed correctly' do
    @contest = BeanCounting.new('abcda')

    result = { "a" => 2, "b" => 1, "c" => 1, "d" => 1 }

    expect(@contest.process_raw_beans).to eq result
  end

  it 'returns correct players hash after submitting guesses' do
    @contest = BeanCounting.new('abcda')

    result = { "A" => Player.new(1, 2), "B" => Player.new(1, 0), "C" => Player.new(0, 1) }

    guesses = "A a:2,c:2\nB a:1\nC d:1\n"
    @contest.submit_guesses(guesses)

    expect(@contest.players).to eq result
  end
end
