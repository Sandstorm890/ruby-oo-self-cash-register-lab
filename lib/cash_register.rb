require "pry"

class CashRegister
    
    attr_accessor :total
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        # binding.pry
    end

    def discount
        @discount
    end

    def add_item(item, price, quantity=1)
        @total += price*quantity
        @last_added_price = price
        @quantity = quantity
        counter = quantity
        while counter > 0
            @items << item
            counter -= 1
        end

    end 

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            x = 1 - (@discount.to_f/100.0)
            # binding.pry
            @total *= x
            "After the discount, the total comes to $#{@total.to_i}."
        end 
    end

    def items
        @items
    end

    def void_last_transaction
        @items.pop
        @total -= @last_added_price*@quantity
    end
end
