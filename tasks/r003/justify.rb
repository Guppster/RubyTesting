
#Justifies into multi lane
def justify(text, max_width)

    counter = 0

    if (text == nil)
        return nil
    end

    #Iterate over each word appending it's letter count to the counter
    #When counter passes max_width param, add newline
    #loop until end string

end

#Justifies just a single lane
def justify_line(text, width)

    #Extract strings
    strings = text.split

    #Get equal width of spaces 
    spaces, remainder = (width - strings.map(&:length).inject(:+)).divmod(strings.length - 1)

    #Add the number of spaces to each word
    strings.take(strings.length - 1).each { |word| spaces.times { word << ' ' }}

    #Trying to account for the remainder
    strings.first.take(remainder).each { |word| word << ' ' }

    return strings.join
end
