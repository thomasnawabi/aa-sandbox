require 'byebug'

# CHALLENGE: Eight queens puzzle precursor
#
# Write a recursive method that generates all 8! possible unique ways to
# place eight queens on a chess board such that no two queens are in
# the same board row or column (the same diagonal is OK).
#
# Each of the 8! elements in the return array should be an array of positions:
# E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
#
# My solution used 3 method parameters: current_row, taken_columns, and
# positions so far



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

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hsh = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |k, idx|
      hsh[k] << idx
    end
    hsh.select { |h, k| k.length > 1 }
  end
end

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    return self if self.none? { |el| el.is_a? Array }
    result = []
    self.each do |el|
      result << el unless el.is_a? Array
      result += el.my_flatten if el.is_a? Array
    end
    result
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n == 0
    result = []
    self.each do |el|
      result << el unless el.is_a? Array
      result += el.my_controlled_flatten(n - 1) if el.is_a? Array
    end
    result
  end
end

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)
    # debugger
    return 0 if self.length == 1 && self.first == target
    return nil if self.length == 1 && self.first != target
    return nil if self.empty?
    mid = self.length / 2
    left = self.take(mid)
    right = self.drop(mid)
    left_find = left.my_bsearch(target, &prc)
    right_find = right.my_bsearch(target, &prc)
    if mid.even?
      return mid - left_find if left_find != nil
      return mid + right_find if right_find != nil
    else
      return (mid - 1) - left_find if left_find != nil
      return mid + right_find if right_find != nil
    end
  end

end

class Array
  # def bubble_sort!
  #
  # end

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
    arr = self.dup
    arr.bubble_sort!(&prc)
  end
end
