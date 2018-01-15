#Justifies into multi lane
def justify(text, max_width)

    #Define the data we're using
    @rawdata = text

    lines = justify_multiple(max_width)

    #Join the new lines with linebreak and return
    return lines.join("\n")
end

def justify_multiple(max_width)

    # Cut off a line before max_width that doesn't cut into the middle of a word
    lines = @rawdata.match(/^.{0,#{max_width}}\b/)

    # For each line thats found, use justify_line method to justify it
    lines.each{ |line| justify_line(line, max_width) }

    return lines
end

#Justifies just a single lane
def justify_line(text, width)

    initialization(text)

    #If only one word don't add whitespace
    return text if @length == 1

    handle_spaces(width)

    #Join together array of new words and return
    return @strings.join
end

def handle_spaces(width)
    compute_space(width)

    put_spaces()

    #Takes the first string and adds the remainder number of spaces to ih
    @remainder.times{ @strings.first() << ' '}
end

def put_spaces()
    #Add the number of spaces to each word
    @strings.take(@real_length).each { |word| @spaces.times { word << ' ' }}
end


def compute_space(width)
    #Get equal width of spaces 
    @spaces, @remainder = (width - @strings.map(&:length).inject(:+)).divmod(@real_length)
end

def initialization(text)
    #Extract strings
    @strings = text.split
    @length = @strings.length
    @real_length = @length - 1
end
