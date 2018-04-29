require 'rspec'

describe 'Using different assertion/expectation libraries' do
  it 'should work with minitest' do
    assert_equal 4, 4
  end

  it 'should work with rspec expectations' do
    expect(4).to eq(4)
  end
end