require 'rspec'

# Context: Assume each of these are different classes that need to be tested,
# since they all have similar behavior and can be run against the same examples,
# we create a shared_example and run it against each of them.

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

  end
end