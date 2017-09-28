require 'minitest/autorun'
require 'benchmark'

#Responsible for handling countdown operations
class CountDown

	#Waits for a specific amount of time and prints output
	def countdown(wait_time)
		print wait_time.to_s + " seconds left\n" 

		wait_time.downto(1).each do |time_left|
			sleep 1
			print time_left.to_s + " seconds left\n" if (((time_left % 60) == 0) && time_left !=  wait_time)
		end
	end
end

#A Test for the countdown operations class
class CountDownTest < Minitest::Test
	def test_120_second_countdown
		counter = CountDown.new

		time = Benchmark.measure {
			counter.countdown(120)
		}

		assert (time.real).round == 120
	end
end
