require_relative '../src/coffee.rb'
require 'rspec'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'log/examples'
end

describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'should cost $1' do
    expect(coffee.price).to eq(1.00)
  end

  it 'should be colder than 200 Fahrenheit' do
    expect(coffee.temperature).to be <= 200.0
  end

  context 'with milk' do
    before do
      coffee.add(:milk)
    end

    it 'should cost $1.25' do
      expect(coffee.price).to eq(1.25)
    end

    it 'should be light in color' do
      expect(coffee.color).to eq(:light)
    end

  end
end