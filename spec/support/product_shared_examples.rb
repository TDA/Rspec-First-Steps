require 'rspec'

# In this shared example we are only passing in params, but these could
# essentially be blocks or any other ruby construct. This example is a simple
# one and thus might be better off as a helper method too.
shared_examples 'Product' do |product, expected_price|
  context 'when the cost per item and quantity is provided' do
    it 'should return the right price' do
      expect(product.price).to eq(expected_price)
    end
  end
end