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
end
