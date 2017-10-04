Discount = Struct.new(:quantity, :value)

class Store 
    #Initialize the items sold at this store
    def initialize(items)

        @Objects = Array.new()

        for item in items
            @Objects.push(items)
        end
    end
end

class Item
    def initialize(name, price, deal)
        @name = name
        @price = price
        @deal = deal
    end
end 

RULES = Store.new([
    Item.new("A", 50, Discount.new(3, 130)),
    Item.new("B", 30, Discount.new(2, 45)),
    Item.new("C", 20, Discount.new()),
    Item.new("D", 15, Discount.new())
])

#Responsible for handling checkout operations
class CheckOut
    def initialize(rules)
        @store = rules
    end

    def total()
    end

    #Takes in a letter {A-D} and returns a numeric price
    #Factoring in the number of times previously scanned
    def scan(item)

    end
end
