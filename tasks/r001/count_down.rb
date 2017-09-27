require 'minitest/autorun'
require 'benchmark'

class R001
	def countdown(wait_time)
		print wait_time.to_s + " seconds left\n"
		sleep 1
		wait_time = wait_time - 1
		wait_time.downto(1).each do |time_left|
			sleep 1
			print time_left.to_s + " seconds left\n" if (time_left % 60) == 0
		end
		print "\a"
	end
end

class R001Test < Minitest::Test
	def test_countdown
		rubyProgram = R001.new

		time = Benchmark.measure {
			rubyProgram.countdown(120)
		}

		assert (time.real).round == 120
	end
end
