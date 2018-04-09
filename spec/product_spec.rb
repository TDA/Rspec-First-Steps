require 'rspec'

Sandwich = Struct.new(:cost, :quantity) do
  def price
    cost * quantity
  end
end
Coffee = Struct.new(:cost, :quantity) do
  def price
    cost * quantity
  end
end
Bread = Struct.new(:cost, :quantity) do
  def price
    cost * quantity
  end
end
Milk = Struct.new(:cost, :quantity) do
  def price
    cost * quantity
  end
end

describe 'Product Prices' do

  describe Sandwich do
    context "when the cost per item and quantity is provided" do
      it 'should return the right price' do
        true.should == false
      end
    end
  end
end