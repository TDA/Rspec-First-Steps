require 'rspec'
require 'pp'

describe 'Metadata' do

  it 'should return metadata', :fast, :focus do |example|
    pp example.metadata
    expect(example.metadata).to be_a_kind_of(Hash)
  end
end