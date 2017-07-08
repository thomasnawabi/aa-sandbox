require 'byebug'

#returns all subsets of an array
def subsets(array)

  return [[]] if array == []
  all_but_last = subsets(array[0...array.length - 1].dup)
  last = array.last
  all_but_last.map { |el| el.dup } + all_but_last.map { |el| el << last }
end

class Array

  def my_rotate(num = 1)
    left = self.drop(num % self.length)
    right = self.take(num % self.length)
    left + right
  end

end

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    return self if self.none? { |el| el.is_a? Array}
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

class Hash

  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    hsh1 = self.dup
    hsh2 = hash2.dup
    result = Hash.new
    hsh1.each do |k, v|
      result[k] = v unless hsh2[k]
    end
    hsh2.each do |k, v|
      result[k] = v
    end
    result
  end

end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  result = [1]

  (2..num).each do |el|
    result << el if num % el == 0
  end
  result
end

class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return self if self.length < 2

    pivot = self.last
    smaller_than_pivot = self.select { |el| prc.call(el, pivot) == -1 }
    equal_to_pivot = self.select { |el| prc.call(el, pivot) == 0 }
    greater_than_pivot = self.select { |el| prc.call(el, pivot) == 1 }
    smaller_than_pivot_sorted = smaller_than_pivot.my_quick_sort(&prc)
    greater_than_pivot_sorted = greater_than_pivot.my_quick_sort(&prc)
    smaller_than_pivot_sorted + equal_to_pivot + greater_than_pivot_sorted
  end

end
