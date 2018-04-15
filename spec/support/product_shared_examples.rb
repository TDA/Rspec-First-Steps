require 'rspec'

# In this shared example we are only passing in params, but these could
# essentially be blocks or any other ruby construct.
shared_examples 'Product' do |product_type|
  context 'when the cost per item and quantity is provided' do
    it 'should return the right price' do
      product = product_type.new(3, 3)
      expected_price = 3 * 3
      expect(product.price).to eq(expected_price)
    end
  end

  context 'when the cost per item is provided' do
    it 'should return the right price for quantity 1' do
      product = product_type.new(3)
      expected_price = 3 * 1
      expect(product.price).to eq(expected_price)
    end
  end
end