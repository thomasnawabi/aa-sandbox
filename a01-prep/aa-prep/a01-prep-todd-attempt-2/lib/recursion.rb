#### Recursion ####

# Write a recursive method that returns the first "num" factorial numbers.
def digital_root(num)
end

# Write a recursive method that returns an array of first n number of factorials
def factorials_rec(num)
end

# Write a recursive method that returns an array of numbers between min and max
def range(min, max)
end

# Write a recursive method that returns the sum of all elements in an array
def sum(nums)
end

# Write a recursive method that exponentiates base ** power without using the ** method
def exp(base, power)
  return 1 if power == 0
  return base if power == 1
  return base if base == 1
  prev = exp(base, power - 1)
  base * prev
end

# Write a recursive method that deep dups an array
class Array
  def deep_dup
    return self.dup if self.none? { |el| el.is_a?(Array) }
    result = []

    self.each do |el|
      result << el.dup unless el.is_a?(Array)
      result << el.deep_dup if el.is_a?(Array)
    end
    result
  end
end

# Write a recursive method that returns the first n number of fibonacci numbers in an array
def fibs_rec(n)
end

# Write a recursive method subsets that will return all subsets of an array.
class Array
  def subsets
  end
end

# Write a recursive method that returns all of the permutations of an array
def permutations(arr)
  return arr if arr.length < 2
  return [[arr[0], arr[1]], [arr[1], arr[0]]] if arr.length == 2
  result = []
  prev = permutations(arr[0...-1]).dup
  prev.each do |el|
    result += add_to_each_pos(el.dup, arr[-1])
  end
  result
end

def add_to_each_pos(arr, target)
  result = Array.new(arr.length + 1) { arr.dup }
  result.each_with_index do |el, idx|
    el.insert(idx, target)
  end
  result
end

# Write a recursive method that returns an array of the best change given a target amouunt
def make_change(target, coins = [25, 10, 5, 1])
end

# Write a recursive method that takes a Fixnum and converts it to a string in a different base
# Do not use the built-in #to_s(base) method.
# |Base 10 (decimal)     |0   |1   |2   |3   |....|9   |10  |11  |12  |13  |14  |15  |
# |Base 2 (binary)       |0   |1   |10  |11  |....|1001|1010|1011|1100|1101|1110|1111|
# |Base 16 (hexadecimal) |0   |1   |2   |3   |....|9   |A   |B   |C   |D   |E   |F   |

class Fixnum
  def stringify(base)
    return "" if self == 0

    digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f g)

    (self / base).stringify(base) + digits[self % base]
  end
end

# Write a recursive method that returns the sum of the first n even numbers
def first_even_numbers_sum(n)
  numbers = first_even_numbers(n)
  return 2 if n == 1
  prev = first_even_numbers_sum(n - 1)
  prev + numbers[n - 1]
end

def first_even_numbers(n)
  result = []
  idx = 2
  while result.length < n
    result << idx
    idx += 2
  end
  result
end
