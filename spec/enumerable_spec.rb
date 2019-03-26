# test for enumerable
require './enumerable'

RSpec.describe Enumerable do
  it 'iterates through an array' do
    expect([1, 2, 3].my_each { |e| e }).to eql([1, 2, 3])
  end

  it 'iterates through an array with index' do
    expect([1, 2, 3].my_each_with_index { |v, i| i }).to eql([0, 1, 2])
  end

  it 'creates a new array with the elements which meet the block condition' do
    expect([2, 5, 7].my_select { |e| e > 3 }).to eql([5, 7])
  end

  it 'returns true if none of the elements meet the block condition' do
    expect([2, 5, 7].my_none? { |e| e == 0 }).to eql(true)
  end

  it 'returns the number of elements inside the array' do
    expect([2, 5, 7].my_count).to eql(3)
  end

  it 'creates a new array with new elements according to the block condition' do
    expect([2, 5, 7].my_map { |e| e + 2 }).to eql([4, 7, 9])
  end
end
