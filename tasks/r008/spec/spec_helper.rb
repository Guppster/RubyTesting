require 'simplecov'
require 'timeout'

SimpleCov.start

RSpec.configure do |c|
  c.around(:each) do |example|
    Timeout::timeout(2) {
      example.run
    }
  end
end

require 'nim'
