require 'rspec'

shared_examples 'URI Parser' do |uri_lib|
  it 'parses the host' do
    expect(uri_lib.parse('http://foo.com/').host).to eq('foo.com')
  end

  it 'parses the port' do
    expect(uri_lib.parse('http://foo.com:9876/').port).to eq(9876)
  end
end