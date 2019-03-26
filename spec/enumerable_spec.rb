# test for enumerable
require './enumerable'

RSpec.describe Enumerable do
  it 'iterates through an array' do
    expect([1,2,3].my_each).to contain_exactly(1, 2, 3)
  end

  it 'iterates through an array with index' do
    expect([1, 2, 3].my_each_with_index { |v, i| puts i }).to contain_exactly(0, 1, 2)
  end
end
