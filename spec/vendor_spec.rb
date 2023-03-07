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

end
