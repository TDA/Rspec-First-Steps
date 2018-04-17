require 'rspec'
require 'addressable/uri'

describe Addressable do
  it 'parses the host' do
    expect(Addressable::URI.parse('http://foo.com/').host).to eq('foo.com')
  end

  it 'parses the port' do
    expect(Addressable::URI.parse('http://foo.com:9876/').port).to eq(9876)
  end

  it 'parses the scheme' do
    expect(Addressable::URI.parse('http://foo.com/').scheme).to eq('http')
  end

  it 'parses the path' do
    expect(Addressable::URI.parse('https://foo.com/bar').path).to eq('/bar')
  end
end