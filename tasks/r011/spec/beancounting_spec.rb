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
end
