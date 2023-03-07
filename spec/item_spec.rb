require 'rspec'
require './lib/item' 

RSpec.describe Item do 
  describe '#initialize' do
    it 'can initialize' do
      item1 = Item.new({name: 'Peach', price: "$0.75"})

      expect(item1).to be_a Item
    end
  end  
end