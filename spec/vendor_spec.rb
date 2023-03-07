require 'rspec'
require './lib/item' 
require './lib/vendor'

RSpec.describe Vendor do 
  describe '#initialize' do
    it 'can initialize' do
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor).to be_a Vendor
    end
  end
end
