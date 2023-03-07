require 'rspec'
require './lib/item' 
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
  describe '#initialize' do
    it 'can initialize' do
      market = Market.new('South Pearl Street Farmers Market') 

      expect(market).to be_a Market
    end

    it 'has attributes' do
      market = Market.new('South Pearl Street Farmers Market') 

      expect(market.name).to eq('South Pearl Street Farmers Market')
      expect(market.vendors).to eq([])
    end
  end

  describe '#add_vendor'
    it 'can add vendors' do 
      market = Market.new('South Pearl Street Farmers Market') 
      vendor1 = Vendor.new('Rocky Mountain Fresh')
      vendor2 = Vendor.new('Ba-Nom-a-Nom')   
      market.add_vendor(vendor1) 
      market.add_vendor(vendor2) 

      expect(market.vendors).to eq([vendor1,vendor2])
    end

  describe '#vendor_names' do 
    it 'can give all vendor names' do 
      market = Market.new('South Pearl Street Farmers Market') 
      vendor1 = Vendor.new('Rocky Mountain Fresh')
      vendor2 = Vendor.new('Ba-Nom-a-Nom') 
      vendor3 = Vendor.new('Palisade Peach Shack') 
      market.add_vendor(vendor1) 
      market.add_vendor(vendor2) 
      market.add_vendor(vendor3)

      expect(market.vendor_names).to eq(['Rocky Mountain Fresh', 'Ba-Nom-a-Nom', 'Palisade Peach Shack'])
    end
  end

  describe '#vendors_that_sell' do 
    it 'can give a list of vendors that sell items' do 
      market = Market.new('South Pearl Street Farmers Market') 
      vendor1 = Vendor.new('Rocky Mountain Fresh')
      vendor2 = Vendor.new('Ba-Nom-a-Nom') 
      vendor3 = Vendor.new('Palisade Peach Shack') 
      item1 = Item.new({name: 'Peach', price: '$0.75'})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
      item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})

      market.add_vendor(vendor1) 
      market.add_vendor(vendor2) 
      market.add_vendor(vendor3)
      vendor1.stock(item1, 35)  
      vendor1.stock(item2, 7)   
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65) 

      expect(market.vendors_that_sell(item1)).to eq([vendor1,vendor3])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
    end
  end

  describe '#sorted_item_list' do 
    it 'can give an alphabetical list of all items being sold' do
      market = Market.new('South Pearl Street Farmers Market') 
      vendor1 = Vendor.new('Rocky Mountain Fresh')
      vendor2 = Vendor.new('Ba-Nom-a-Nom') 
      vendor3 = Vendor.new('Palisade Peach Shack') 
      item1 = Item.new({name: 'Peach', price: '$0.75'})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
      item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})

      market.add_vendor(vendor1) 
      market.add_vendor(vendor2) 
      market.add_vendor(vendor3)

      vendor1.stock(item2, 7)   
      vendor2.stock(item4, 50) 

      expect(market.sorted_item_list).to eq(['Banana Nice Cream', 'Tomato'])
    end

  end
end
