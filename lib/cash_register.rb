require "pry"

class CashRegister
  attr_reader :total
  attr_accessor :discount
  
  def initialize(discount=0)
    @total = 0
    @new_list = []
    @transactions = []
    @discount= discount
  end

  def total=(total)
    @total=total
  end
  
  def add_item(item, price, quantity=1)
    @transactions.push({"item" => item, "price" => price, "quantity" => quantity})
    self.refresh_data
  end

  def refresh_data
    total = 0
    @new_list = []
    @transactions.each do |object|
     total += (object["price"] * object["quantity"])
     object["quantity"].times { @new_list << object["item"] }
    end
    @total = total
  end
    # @total = @total + price * quantity
    # n=1
    # while n <= quantity
    #   @new_list << item
    #   n+=1
    # end

  

  def apply_discount
    if @discount > 0
      @total = (@total * ((100 - @discount) / 100.0)).to_i
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end 
  end

  def items
    @new_list
  end 

  def void_last_transaction
    @transactions.pop()
    self.refresh_data

  end



end 
