require 'rspec'

describe URI do
  it 'parses the host' do
    expect(URI.parse('http://foo.com/').host).to eq('foo.com')
  end

  it 'parses the port' do
    expect(URI.parse('http://foo.com:9876/').port).to eq(9876)
  end

  it 'defaults http port to 80' do
    expect(URI.parse('http://foo.com/').port).to eq(80)
  end

  it 'defaults https port to 443' do
    expect(URI.parse('https://foo.com/').port).to eq(443)
  end
end