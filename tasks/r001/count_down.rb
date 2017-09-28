require 'minitest/autorun'
require 'benchmark'

#Supports print functionality without I/O
class QuietPrintMethod 

	#Does not print a message
	def print(message)
		#Throw away the message
		@message = message
	end
end

#Assists other classes in printing messages
class PrintMethod 

	#Prints a message
	def print(message)
		puts message
	end
end


#Responsible for handling countdown operations
class CountDown

	#Constructor
	def initialize(printer)
		@printer = printer
	end

	#Waits for a specific amount of time and prints output
	def countdown(wait_time)
		@printer.print(wait_time.to_s + " seconds left\n")

		wait_time.downto(1).each do |time_left|
			sleep 1
			@printer.print(time_left.to_s + " seconds left\n") if (((time_left % 60) == 0) && time_left !=  wait_time);
		end
	end
end

#A Test for the countdown operations class
class CountDownTest < Minitest::Test
	def test_120_second_countdown
		counter = CountDown.new(QuietPrintMethod.new)

		time = Benchmark.measure {
			counter.countdown(120)
		}

		assert (time.real).round == 120
	end
end
