class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    names
  end
  
  def vendors_that_sell(item)
    sellers = []
    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(item)
        sellers << vendor
      end
    end
    sellers
  end

  def sorted_item_list
    raw_list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, _|
        raw_list << item.name
      end
    end
    raw_list.flatten.sort.uniq
  end

  def total_number_of_item(item)
    total = 0 
    vendors.each do |vendor| 
      total += vendor.check_stock(item)
    end
    total
  end

  def object_list
    raw_list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, _|
        raw_list << item
      end
    end
    raw_list
  end

  def item_inventory(item)
    item_hash = {
      quantity: total_number_of_item(item),
      vendors: vendors_that_sell(item)
    }
  end

  def total_inventory
    market_inventory = Hash.new
    object_list.each do |item|
      market_inventory[item] = item_inventory(item)
    end
    market_inventory
  end

  

end