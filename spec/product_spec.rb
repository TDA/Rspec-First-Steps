# frozen_string_literal: true

require 'rspec'
require_relative 'support/product_shared_examples'

# Context: Assume each of these are different classes that need to be tested,
# since they all have similar behavior and can be run against the same examples,
# we create a shared_example and run it against each of them.

Sandwich = Struct.new(:cost, :quantity) do
  def initialize(*)
    super
    self.quantity ||= 1
  end

  def price
    cost * quantity
  end
end

Coffee = Struct.new(:cost, :quantity) do
  def initialize(*)
    super
    self.quantity ||= 1
  end

  def price
    cost * quantity
  end
end

Bread = Struct.new(:cost, :quantity) do
  def initialize(*)
    super
    self.quantity ||= 1
  end

  def price
    cost * quantity
  end
end

Milk = Struct.new(:cost, :quantity) do
  def initialize(*)
    super
    self.quantity ||= 1
  end

  def price
    cost * quantity
  end
end

describe 'Product Prices' do
  describe Sandwich do
    it_behaves_like 'Product', Sandwich.new(1, 2), 2
  end

  describe Coffee do
    it_behaves_like 'Product', Coffee.new(5, 6), 30
  end

  describe Bread do
    it_behaves_like 'Product', Bread.new(2, 11), 22
  end

  describe Milk do
    it_behaves_like 'Product', Milk.new(3, 3), 9
  end
end
