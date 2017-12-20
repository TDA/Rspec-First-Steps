require 'rspec'

Sandwich = Struct.new(:taste, :toppings)

describe 'An ideal sandwich' do
  describe 'with before hooks' do
    before do
      @sandwich = Sandwich.new('delicious', [])
    end

    it 'is delicious' do
      taste = @sandwich.taste
      expect(taste).to eq('delicious')
    end

    it 'allows me to add toppings' do
      @sandwich.toppings << 'Cheese'
      expect(@sandwich.toppings).not_to be_empty
    end
  end
end