require 'rspec'

describe 'Using different assertion/expectation libraries' do
  it 'should work with minitest' do
    assert_equal 4, 4
  end

  it 'should work with rspec expectations' do
    expect(4).to eq(4)
  end
  
  it 'should work with wrong' do
    # assert(explanation = nil, depth = 0, block)
    # This might not be working actually, I think rspec is using minitest
    # instead of Wrong, even though Rubymine recognizes this is a Wrong method
    assert('wrong pass?', 0) { 4 == 4 }
  end
end