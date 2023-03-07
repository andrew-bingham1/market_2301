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

  describe '#check_stock' do
    it 'can check stock' do 
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})

      expect(vendor.check_stock(item1)).to eq(0)
    end
  end

end
