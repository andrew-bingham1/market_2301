class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount 
  end

  def potential_revenue
    possible_rev = 0
    @inventory.each do |item, amount|
      sum = item.price * amount 
      possible_rev += sum 
    end
    possible_rev
  end
end
