require 'rspec'
require './lib/item' 
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
  describe '#initialize' do
    it 'can initialize' do
      market = Market.new("South Pearl Street Farmers Market") 

      expect(market).to be_a Market
    end

    it 'has attributes' do
      market = Market.new("South Pearl Street Farmers Market") 

      expect(market.name).to eq("South Pearl Street Farmers Market")
      expect(market.vendors).to eq([])
    end
  end

  describe '#add_vendor'
    it 'can add vendors' do 
      market = Market.new("South Pearl Street Farmers Market") 
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")   
      market.add_vendor(vendor1) 
      market.add_vendor(vendor2) 

      expect(market.vendors).to eq([vendor1,vendor2])
    end

  describe '#vendor_names' do 
    it 'can give all vendor names' do 
      market = Market.new("South Pearl Street Farmers Market") 
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom") 
      vendor3 = Vendor.new("Palisade Peach Shack") 
      market.add_vendor(vendor1) 
      market.add_vendor(vendor2) 
      market.add_vendor(vendor3)

      expect(market.vendor_names).to eq(["South Pearl Street Farmers Market", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
  # describe '#vendors_that_sell' do 
  #   it 'can give a list of vendors that sell '
  # end
end
