#Responsible for storing data about a single object
class Item < Struct.new(:name, :price, :deal)
    def sell(quantity)

        return quantity * price - get_sale(quantity)
    end

    private
    def get_sale(quantity)
        if (deal != nil)
            return deal.evaluate(quantity)
        end
        return 0
    end
end

#Represents a deal for a specific sale item
class Discount < Struct.new(:quantity_required, :value)
    def evaluate(number_sold)
        return (number_sold / self.quantity_required).floor * self.value
    end
end

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
    def sell_receipt(receipt)
        #Calculate cost
        receipt.inject(0) do | total_cost, (item, quantity) |
            total_cost + find_object(item).sell(quantity)
        end
    end

    def find_object(item)
        return @objects.detect{|object| object.name == item}
    end

end

RULES = Store.new([
    Item.new("A", 50, Discount.new(3, 20)),
    Item.new("B", 30, Discount.new(2, 15)),
    Item.new("C", 20),
    Item.new("D", 15) 
])

#Responsible for handling checkout operations
class CheckOut

    def initialize(rules)
        @store = rules
        @receipt = Hash.new(0)
    end

    def total()
        return @store.sell_receipt(@receipt)
    end

    #Takes in a letter {A-D} and returns a numeric price
    #Factoring in the number of times previously scanned
    def scan(item)
        @receipt[item] += 1
    end
end
