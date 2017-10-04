
#Responsible for storing data about a single object
Item = Struct.new(:name, :price, :deal)

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

        #Categorize purchases
        categorize(receipt);
        
        #Calculate cost
        receipt.inject(0) do | total_cost, item |
            total_cost + sell_item(item)
        end
    end

    #Given a single item, determines its value
    def sell_item(item)
        @objects.detect{|object| object.name == item}.deal.evaluate()
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
        @receipt = Hash.new
    end

    def total()
        return @store.sell_receipt(receipt)
    end

    #Takes in a letter {A-D} and returns a numeric price
    #Factoring in the number of times previously scanned
    def scan(item)
        if (@receipt[item] == nil)
            @receipt[item] = 0
        end

        @receipt[item] += 1
    end
end
