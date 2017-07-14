require 'rspec'
require_relative 'practice_test'
describe "exponent" do
  it "correctly handles positive powers" do
    expect(exponent(5,3)).to eq(125)
  end

  it "correctly handles negative powers" do
    expect(exponent(2, -3)).to eq(1/8.0)
  end

  it "correctly handles 0" do
    expect(exponent(2, 0)).to eq(1)
  end
end

describe "#dups" do
  it "solves a simple example" do
    expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
  end

  it "finds two dups" do
    expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
  end

  it "finds multi-dups" do
    expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
  end

  it "returns {} when no dups found" do
    expect([1, 3, 4, 5].dups).to eq({})
  end
end

describe "my_flatten" do
  it 'Flattens arrays correctly' do
    expect([1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end
end

describe "my_controlled_flatten" do
  it "Flattens an array the specified number of levels" do
    expect([1,[2,3], [4,[5]], [[6,[7]]]].my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end
end

describe "#factors" do
  it "returns the factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end

describe "my_bsearch" do

  it "finds the first element in the array" do
    expect([1, 2, 3].my_bsearch(1)).to eq(0)
  end

  it "finds an element for an array with an even number of elements" do
    expect([2, 3, 4, 5].my_bsearch(3)).to eq(1)
  end

  it "finds an element for an array with an odd number of elements" do
    expect([2, 4, 6, 8, 10].my_bsearch(6)).to eq(2)
  end

  it "finds an element in the second half of the array (even)" do
    expect([1, 3, 4, 5, 9].my_bsearch(5)).to eq(3)
  end

  it "finds an element in the second half of the array (odd)" do
    expect([1, 2, 3, 4, 5, 6].my_bsearch(6)).to eq(5)
  end

  it "Returns nil if the element is not in the array (smaller)" do
    expect([1, 2, 3, 4, 5, 6].my_bsearch(0)).to eq(nil)
  end

  it "Returns nil if the element is not in the array (bigger)" do
    expect([1, 2, 3, 4, 5, 7].my_bsearch(6)).to eq(nil)
  end

end

describe "my_quick_sort" do

  a = (0..8).to_a

  it "Sorts an array of numbers with no duplicates" do
    expect(a.shuffle.my_quick_sort).to eq(a)
  end

  it "Sorts an array of numbers with duplicates" do
    expect([1,2,3,3,9,10,10,17,432].shuffle.my_quick_sort).to eq([1,2,3,3,9,10,10,17,432])
  end

  it "Sorts according to the block passed in" do
    expect(a.shuffle.my_quick_sort{|a,b| b<=>a}).to eq(a.reverse)
  end
end

