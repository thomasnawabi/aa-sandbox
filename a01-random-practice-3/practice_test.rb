# return b^n recursively. Your solution should accept negative values
# for n
def exponent(b, n)
  return 1 if n == 0
  return b if n == 1
  return 1 if b == 1
  if n > -1
    b * exponent(b, n - 1)
  else
    1.0 / exponent(b, n * (-1) )
  end
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hsh = Hash.new { |h, k| h[k] = []}
    self.each_with_index do |el, idx|
      hsh[el] << idx
    end
    hsh.select { |k, v| v.length > 1 }
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

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).select { |el| num % el == 0 }
end

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)

    return 0 if self.length == 1 && self.first == target
    return nil if self.length == 1 && self.first != target
    return nil if self.length == 0
    mid = self.length / 2
    left = self.take(mid)
    right = self.drop(mid)
    left_find = left.my_bsearch(target, &prc)
    right_find = right.my_bsearch(target, &prc)
    if mid.even?
      return mid - left_find if left_find
      return mid + right_find if right_find
    else
      return mid - 1 - left_find if left_find
      return mid + right_find if right_find
    end
  end

end

class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if self.length < 2
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    pivot = self.last
    less_than_pivot = self.select { |el| prc.call(pivot, el) == 1 }
    equal_to_pivot = self.select { |el| prc.call(pivot, el) == 0 }
    greater_than_pivot = self.select { |el| prc.call(pivot, el) == -1 }
    less_than_pivot_sorted = less_than_pivot.my_quick_sort(&prc)
    greater_than_pivot_sorted = greater_than_pivot.my_quick_sort(&prc)

    less_than_pivot_sorted + equal_to_pivot + greater_than_pivot_sorted
  end

end
