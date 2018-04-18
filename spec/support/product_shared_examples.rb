require 'rspec'

# In this shared example we are only passing in params, but these could
# essentially be blocks or any other ruby construct.
shared_examples 'Product' do |product_type|
  # Keep in mind that shared_context and shared_example do the *exact* same thing behind the scenes
  # It is a matter of communicating your intent, i.e. if a bunch of examples need to be run for different
  # tests, use shared_examples. e.g. "If products x,y,z behave like shared_example"
  # if a bunch of examples need a common setup/context to run, then use
  # shared_context, e.g. "Setup 5 users for the following tests", "Setup the following helper methods for these tests"
  before do end

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