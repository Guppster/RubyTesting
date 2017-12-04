require 'spec_helper'

describe BeanCounting do

  it 'count beans returns correct amount after initialization' do
    @contest = BeanCounting.new('abcda')

    expect(@contest.count_beans('a')).to eq 2
  end

end
