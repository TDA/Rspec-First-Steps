require 'rspec'
require 'pp'

describe 'Metadata', :outer_group do

  it 'should return metadata', :fast, :focus do |example|
    pp example.metadata
    expect(example.metadata).to be_a_kind_of(Hash)
  end

  context 'on a nested group' do
    it 'should inherit metadata' do |example|
      pp example.metadata
    end
  end
end