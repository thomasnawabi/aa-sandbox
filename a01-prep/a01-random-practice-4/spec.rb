require 'rspec'
require_relative 'practice_test'
describe "#base_converter" do
  it "converts a small number in binary" do
    expect(base_converter(5, 2)).to eq("101")
  end

  it "converts a large number into base 16" do
    expect(base_converter(1239449, 16)).to eq("12e999" || "12E999" )
  end
end

describe "my_join" do
  a = [ "a", "b", "c", "d" ]

  it "Joins an array if no argument is passed" do
    expect(a.my_join).to eq("abcd")
  end

  it "Joins an array if an argument is passed" do
    expect(a.my_join("$")).to eq("a$b$c$d")
  end
end


describe "#primes" do

  it "returns first five primes in order" do
    expect(primes(5)).to eq([2, 3, 5, 7, 11])
  end

  it "returns an empty array when asked for zero primes" do
    expect(primes(0)).to eq([])
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

describe "#two_sum" do
  it "returns positions of pairs of numbers that add to zero" do
    expect([5, 1, -7, -5].two_sum).to eq([[0, 3]])
  end

  it "finds multiple pairs" do
    expect([5, -1, -5, 1].two_sum).to eq([[0, 2], [1, 3]])
  end

  it "finds pairs with same element" do
    expect([5, -5, -5].two_sum).to eq([[0, 1], [0, 2]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq([])
  end

  it "won't find spurious zero pairs" do
    expect([0, 1, 2, 3].two_sum).to eq([])
  end

  it "will find real zero pairs" do
    expect([0, 1, 2, 0].two_sum).to eq([[0, 3]])
  end
end

describe "#bubble_sort!" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].bubble_sort!).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort!).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort!).to eq(array.sort)
  end

  it "modifies the original array" do
    duped_array = array.dup
    array.bubble_sort!
    expect(duped_array).not_to eq(array)
  end

  it "will use a block if given" do
    sorted = array.bubble_sort! do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end
end

describe "#bubble_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "delegates to #bubble_sort!" do
    expect_any_instance_of(Array).to receive(:bubble_sort!)

    array.bubble_sort
  end

  it "does not modify the original array" do
    duped_array = array.dup
    array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

