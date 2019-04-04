# test for enumerable
require './enumerable'

RSpec.describe Enumerable do
  let(:a) { [1, 2, 3, 4, 5] }

  it 'returns true if all the elements meet the condition' do
    expect(a.my_all? { |e| e > 3 }).to be false
  end

  it 'returns true if none of the elements meet the block condition' do
    expect(a.my_none? { |e| e == 0 }).to be true
  end

  it 'reduces the elements according to the block condition' do
    expect(a.my_inject { |acc, e| acc + e }).to eql(15)
  end

  it 'returns the product of the elements' do
    expect(multiply_els(a)).to eql(120)
  end

  it 'creates a new array with the elements which meet the block condition' do
    expect(a.my_select { |e| e > 3 }).to eql([4, 5])
  end

  it 'returns the number of elements inside the array' do
    expect(a.my_count).to eql(5)
  end

  it 'creates a new array with new elements according to the block condition' do
    expect(a.my_map { |e| e + 2 }).to eql([3, 4, 5, 6, 7])
  end
end
