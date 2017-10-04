
#Responsible for storing data about a single object
Item = Struct.new(:name, :price, :deal)

#Represents a deal for a specific sale item
Discount = Struct.new(:quantity, :value)

#Represents a store and all it's functions
class Store 
    #Initialize the items sold at this store
    def initialize(items)

        @objects = Array.new()

        for item in items
            @objects.push(item)
        end
    end

    #Given an array of items, determines the total value
    def sell(receipt)
        for item in receipt

        end
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
        @receipt = Array.new
    end

    def total()
        return @store.calculateSale(receipt)
    end

    #Takes in a letter {A-D} and returns a numeric price
    #Factoring in the number of times previously scanned
    def scan(item)
        receipt.push(item)
    end
end
