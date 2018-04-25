require 'rspec'
require 'pp'

describe 'Metadata', :outer_group do
  let(:poly_value) do |example|
    case example.metadata[:type]
    when :positive
      5
    when :negative
      -5
    else
      0
    end
  end

  it 'should return metadata', :fast do |example|
    pp example.metadata
    expect(example.metadata).to be_a_kind_of(Hash)
  end

  context 'on a nested group' do
    it 'should inherit metadata', type: :positive do |example|
      pp poly_value
      pp example.metadata
    end

    it 'should get poly metadata', type: :negative do |example|
      pp poly_value
      pp example.metadata
    end
  end
end
