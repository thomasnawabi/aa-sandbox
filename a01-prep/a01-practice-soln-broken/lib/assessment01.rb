require 'byebug'

class Array
  def my_inject(accumulator = nil, &block)
    i = 0

    unless accumulator
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end

    accumulator
  end
end

def is_prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def primes(count)
  primes = []

  i = 2
  until primes.count >= count
    primes << i if is_prime?(i)

    i += 1
  end

  primes
end

# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

class Array
  def dups
    positions = Hash.new { |h, k| h[k] = [] }

    self.each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end

class String
  def symmetric_substrings
    symm_subs = []

    length.times do |start_pos|
      (2..(length - start_pos)).each do |len|
        substr = self[start_pos..(start_pos + len)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs.uniq
  end
end

class Array
  def merge_sort(&prc)
    # debugger
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    mid = self.count / 2
    left = self.take(mid)
    right = self.drop(mid)
    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)
    self.class.merge(left_sorted, right_sorted, &prc)
  end


  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end
end
