Given('Beans {beans}') do |beans|
  @contest = BeanCounting.new(beans)
end

When('guesses {guesses} are processed') do |guesses|
  @contest.submitGuesses(guesses)
end

Then('rewards are equal to {rewards}') do |rewards|
  expect(@contest.getRewardList).to eq rewards
end
