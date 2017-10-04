RULES = {
    'A' => 1
}

#Responsible for handling checkout operations
class CheckOut
    def initialize(rules)
        @rules = rules
    end

    def total()
    end

    def scan(item)
        item
    end
end
