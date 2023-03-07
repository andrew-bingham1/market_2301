require 'rspec'
require './lib/item' 
require './lib/vendor'

RSpec.describe Vendor do 
  describe '#initialize' do
    it 'can initialize' do
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor).to be_a Vendor
    end

    it 'has a name and inventory' do 
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
    end
  end

  describe '#check_stock and stock' do
    it 'can check stock' do 
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})

      expect(vendor.check_stock(item1)).to eq(0)
    end

    it 'can stock itmes' do 
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      vendor.stock(item1, 25)

      expect(vendor.inventory.keys.first.name).to eq('Peach')
      expect(vendor.inventory.values.first).to eq(25)
    end

    it 'can add more to existing item' do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      vendor.stock(item1, 25)
      vendor.stock(item1, 30)

      expect(vendor.check_stock(item1)).to eq(55)
    end

    it 'can add multiple items' do 
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor.stock(item1, 25)
      vendor.stock(item2, 12)

      expect(vendor.inventory.keys.count).to eq(2)
    end
  end

  describe '#potential revenue' do 

  market = Market.new("South Pearl Street Farmers Market") 
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom") 
      vendor3 = Vendor.new("Palisade Peach Shack") 
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)  
      vendor1.stock(item2, 7)   
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65) 

      expect(vendor1.potential_revenue).to eq(29.75)
      expect(vendor2.potential_revenue).to eq(345.00)      
      expect(vendor3.potential_revenue).to eq(48.75)
  end

end
