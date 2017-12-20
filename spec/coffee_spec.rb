require 'rspec'

class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00
  end
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'log/examples'
end

describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'should cost $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with milk' do
    before do
      coffee.add(:milk)
    end

    it 'should cost $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end
end