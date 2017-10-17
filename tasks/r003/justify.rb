
#Justifies into multi lane
def justify(text, max_width)

    counter = 0

    if (text == nil)
        return nil
    end

    # Cut off a line before max_width that doesn't cut into the middle of a word
    lines = text.match(/^.{0,#{max_width}}\b/)

    # For each line thats found, use justify_line method to justify it
    lines.each{ |line| justify_line(line, max_width) }

    #Join the new lines with linebreak and return
    return lines.join("\n")
end

#Justifies just a single lane
def justify_line(text, width)

    #Extract strings
    strings = text.split

    #If only one word don't add whitespace
    return text if strings.length == 1

    #Get equal width of spaces 
    spaces, remainder = (width - strings.map(&:length).inject(:+)).divmod(strings.length - 1)

    #Add the number of spaces to each word
    strings.take(strings.length - 1).each { |word| spaces.times { word << ' ' }}

    #Takes the first string and adds the remainder number of spaces to ih
    remainder.times{ strings.first() << ' '}

    #Join together array of new words and return
    return strings.join
end
