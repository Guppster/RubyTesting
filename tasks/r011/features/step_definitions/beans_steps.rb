Given('Beans {string}') do |string|
  @contest = BeanCounting.new(string)
end

When('guesses {string} are processed') do |string|
  @contest.submit_guesses(string)
end

Then('rewards are equal to {string}') do |string|
  expect(@contest.get_reward_list).to eq string
end
