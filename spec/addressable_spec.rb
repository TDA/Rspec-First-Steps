require 'rspec'
require 'addressable/uri'
require_relative 'support/uri_shared_examples'

describe Addressable do
  it_behaves_like 'URI Parser', Addressable::URI

  it 'parses the scheme' do
    expect(Addressable::URI.parse('http://foo.com/').scheme).to eq('http')
  end

  it 'parses the path' do
    expect(Addressable::URI.parse('https://foo.com/bar').path).to eq('/bar')
  end
end