require 'minitest/autorun'

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


class CountDownTest < Minitest::Test

end
