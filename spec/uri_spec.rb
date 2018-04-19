require 'rspec'
require_relative 'support/uri_shared_examples'

describe URI do
  it_behaves_like 'URI Parser', URI

  it 'defaults http port to 80' do
    expect(URI.parse('http://foo.com/').port).to eq(80)
  end

  it 'defaults https port to 443' do
    expect(URI.parse('https://foo.com/').port).to eq(443)
  end
end