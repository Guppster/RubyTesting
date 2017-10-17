
    #Justifies into multi lane
    def justify(text, max_width)

        @rawdata = text

        # Cut off a line before max_width that doesn't cut into the middle of a word
        lines = @rawdata.match(/^.{0,#{max_width}}\b/)

        # For each line thats found, use justify_line method to justify it
        lines.each{ |line| justify_line(line, max_width) }

        #Join the new lines with linebreak and return
        return lines.join("\n")
    end

    #Justifies just a single lane
    def justify_line(text, width)

        #Extract strings
        @strings = text.split
        @length = @strings.length
        @real_length = @length - 1

        #If only one word don't add whitespace
        return text if @length == 1

        #Get equal width of spaces 
        spaces, remainder = (width - @strings.map(&:length).inject(:+)).divmod(@real_length)

        #Add the number of spaces to each word
        @strings.take(@real_length).each { |word| spaces.times { word << ' ' }}

        #Takes the first string and adds the remainder number of spaces to ih
        remainder.times{ @strings.first() << ' '}

        #Join together array of new words and return
        return @strings.join
    end
