#### Recursion ####

# Write a recursive method that returns the first "num" factorial numbers.
def digital_root(num)
  return num if num < 10
  result = 0
  while num > 0
    result += num % 10
    num /= 10
  end
  digital_root(result)
end

# Write a recursive method that returns an array of first n number of factorials
def factorials_rec(num)
  return [1] if num == 1
  prev = factorials_rec(num - 1)
  prev << prev.last * (num - 1)
end

# Write a recursive method that returns an array of numbers between min and max
def range(min, max)
  return [] if min + 1 == max
  return [] if max < min
  return [min + 1] if min + 1 == max - 1
  prev = range(min, max - 1)
  prev << max - 1
end

# Write a recursive method that returns the sum of all elements in an array
def sum(nums)
  return 0 if nums == []
  return nums.first if nums.length == 1
  prev = sum(nums[0...-1])
  prev + nums.last
end

# Write a recursive method that exponentiates base ** power without using the ** method
def exp(base, power)
  return 1 if power == 0
  return base if power == 1
  return base if base == 1
  base * exp(base, power - 1)
end

# Write a recursive method that deep dups an array
class Array
  def deep_dup
    return self.dup if self.none? { |el| el.is_a? Array }
    result = []
    self.each do |el|
      result << el unless el.is_a? Array
      result << el.deep_dup if el.is_a? Array
    end
    result
  end
end

# Write a recursive method that returns the first n number of fibonacci numbers in an array
def fibs_rec(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  prev = fibs_rec(n - 1)
  prev << prev[-2] + prev[-1]
end

# Write a recursive method subsets that will return all subsets of an array.
class Array
  def subsets
    return [[]] if self == []
    prev = self[0...-1].subsets
    prev_copy = prev.map { |el| el.dup }
    prev_copy + prev.map { |el| el << self.last }
  end
end

# Write a recursive method that returns all of the permutations of an array
def permutations(arr)
  return self if arr.length < 2
  return [[arr[0], arr[1]], [arr[1], arr[0]]] if arr.length == 2
  prev = permutations(arr[0...-1])
  result = []
  prev.each { |el| result += add_to_each_pos(el, arr.last) }
  result.sort
end

def add_to_each_pos(arr, target)
  result = Array.new(arr.length + 1) { arr.dup }
  result.each_with_index do |el, idx|
    el.insert(idx, target)
  end
  result
end


# Write a recursive method that returns an array of the best change given a target amouunt

def make_change(amt, arr = [25, 10, 5, 1])
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
  return 2 if n == 1
  idx = 2
  numbers = []
  while numbers.length < n
    numbers << idx
    idx += 2
  end
  prev = first_even_numbers_sum(n - 1)
  prev + numbers[n - 1]
end
