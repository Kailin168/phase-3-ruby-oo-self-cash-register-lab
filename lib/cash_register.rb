require "pry"

class CashRegister
  attr_reader :total
  attr_accessor :discount
  
  def initialize(discount=0)
    @total = 0
    @new_list = []
    @discount= discount
  end

  def total=(total)
    @total=total
  end
  
  def add_item(item, price, quantity=1)
    @total = @total + price * quantity
    n=1
    while n <= quantity
      @new_list << item
      n+=1
    end

  end

  def apply_discount
    if @discount > 0
      cal = 100 - @discount
      @total = @total * cal / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end 
  end

  def items
    @new_list
  end 

  def void_last_transaction
    

  end



end 
