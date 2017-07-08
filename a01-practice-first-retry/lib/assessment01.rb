require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)

    if accumulator == nil
      accumulator = self.first
      self.drop(1).each { |el| accumulator = prc.call(accumulator, el) }
      accumulator
    else
      self.each { |el|  accumulator = prc.call(accumulator, el) }
      accumulator
    end

  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |el|
    return false if num % el == 0
  end
  true
end

def primes(num)
  result = []
  idx = 2
  while result.length < num
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
  prev << (num - 1) * prev[-1]
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    count = Hash.new { |h, k| h[k] = [0, []] }
    self.each_with_index do |el, idx|
      count[el][0] += 1
      count[el][1] << idx
    end
    count2 = count.select { |k, v| v[0] > 1 }
    result = Hash.new
    count2.each do |k, v|
      result[k] = v[1]
    end
    result
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = self.substrings
    subs.select { |el| el.palindrome? }
  end

  def substrings
    result = []
    idx = 0
    jdx = 1
    while idx < self.length + 1
      while jdx < self.length
        result << self[idx..jdx]
        jdx += 1
      end
      idx += 1
      jdx = idx + 1
    end
    result.uniq
  end

  def palindrome?
    idx = 0
    jdx = self.length - 1
    while idx < jdx
      return false if self[idx] != self[jdx]
      idx += 1
      jdx -= 1
    end
    return true
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length < 2
    mid = self.length / 2


    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    self.class.merge(sorted_left, sorted_right, prc)
  end

  private
  def self.merge(left, right, prc)
    prc ||= Proc.new() {|el1, el2| el1 <=> el2}
    result = []
    until left.empty? || right.empty?
        prc.call(left.first, right.first) < 1 ?
          result << left.shift : result << right.shift
    end
    result + left + right
  end
end
