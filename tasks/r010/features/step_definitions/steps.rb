Given /I am computing prime factors/ do

end

Given("I am computing the prime factors") do

end

When /I input (\d+)/ do |input|
  @result = PrimeFactors.for(input)
end

Then('I get back {string}') do |string|
  expect(@result).to eq string.split(',').map(&:to_i)
end
