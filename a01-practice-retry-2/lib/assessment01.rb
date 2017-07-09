require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    i = 0
    unless accumulator
      accumulator = self[0]
      i += 1
    end

    while i < self.length
      accumulator = prc.call(accumulator, self[i])
      i += 1
    end

    accumulator

  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).none? { |el| num % el == 0 }
end

def primes(num)
  result = []
  idx = 2
  until result.length == num
    result << idx if is_prime?(idx)
    idx += 1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  prev = factorials_rec(num - 1)
  prev << prev[-1] * (num - 1)
  prev
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hsh = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |el, idx|
      hsh[el] << idx
    end

    hsh.select { |k, v| v.length > 1 }
  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = []
    idx = 0
    jdx = 1
    while idx + 1 < self.length
      while jdx < self.length
        subs << self[idx..jdx]
        jdx += 1
      end
      idx += 1
      jdx = idx + 1
    end
    subs.select { |el| el == el.reverse }
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return self if self.length < 2

    mid = self.length / 2
    left = self.take(mid)
    right = self.drop(mid)
    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)
    self.class.merge(left_sorted, right_sorted, &prc)

  end

  private
  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end
    result + left + right
  end
end
