require 'pry'
class CashRegister
  attr_accessor :total, :discount, :last_transaction
  attr_reader :items

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.last_transaction = []
    quantity.times do 
      items << title
      last_transaction << price
    end
    self.total += (price * quantity)
  end

  def apply_discount
    return "There is no discount to apply." if discount == 0
    self.total -= (self.total * (discount / 100.0)).to_i
    "After the discount, the total comes to $#{self.total}."
  end

  def void_last_transaction
    last_transaction.each do |price|
      self.total -= price
      self.items.pop()
    end
    last_transaction = []
  end
end