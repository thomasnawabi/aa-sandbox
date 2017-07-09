# Write a recursive method that takes in a base 10 number n and
# converts it to a base b number. Return the new number as a string
#
# E.g. base_converter(5, 2) == "101"
# base_converter(31, 16) == "1f"

def base_converter(num, b)
  # MISSING
end

class Array

  def my_join(str = "")
    result = ""
    self[0...-1].each { |el| result += el + str }
    result += self.last
    result
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
  while result.length < num
    result << idx if is_prime?(idx)
    idx += 1
  end
  result
end

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)
    return nil if self.length == 0

    mid = self.length / 2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      self.take(mid).my_bsearch(target)
    else
      result = self.drop(mid + 1).my_bsearch(target)
      result.nil? ? nil : mid + 1 + result
    end
  end

end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []
    idx = 0
    jdx = 1
    while idx + 1 < self.length
      while jdx < self.length
        result << [idx, jdx] if self[idx] + self[jdx] == 0
        jdx += 1
      end
      idx += 1
      jdx = idx + 1
    end
    result

  end
end

class Array

  def bubble_sort!(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    sorted = false

    until sorted
      sorted = true
      self.each_with_index do |el, idx|
        next if idx + 1 == self.length
        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    dupl = self.dup
    dupl.bubble_sort!
  end
end
