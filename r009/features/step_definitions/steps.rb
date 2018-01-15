Given /that I am calculating GCD/ do

end

When /I input the numbers (\d+) and (\d+)/ do |number1, number2|
  @result = gcd(number1, number2)
end

Then /I get back (\d+)/ do |output|
  expect(@result).to eq output
end
