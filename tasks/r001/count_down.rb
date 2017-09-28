require 'minitest/autorun'
require 'benchmark'

#Supports print functionality without I/O
class QuietPrintMethod 

	def initialize
		@duration = 0
		@lastMessageTime = Time.now
	end

	#Does not print a message
	def print(message)
		time = Time.now

		@duration += (time - @lastMessageTime)

		@lastMessageTime = time

		@message = message

	end

	#Returns the total duration from first print message to last
	def timeInterval()
		@duration
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

		@printer.print("Finished waiting")
	end
end

#A Test for the countdown operations class
class CountDownTest < Minitest::Test

	TIME = 120

	def test_timed_countdown
		printer = QuietPrintMethod.new

		counter = CountDown.new(printer)

		counter.countdown(TIME)

		duration = printer.timeInterval

		assert (duration).round == TIME
	end
end
