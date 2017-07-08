# Array Subsets
#
# Write a method subsets that will return all subsets of an array.
#
# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.
#
# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:
#
# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.

require 'byebug'

class Array

  def subsets
    # debugger
    return [[]] if self == []
    all_but_last = self[0...-1].subsets
    last = self[-1]
    all_but_last.map { |el| el.dup } + all_but_last.map { |el| el << last }
    end

end

p [].subsets # => [[]]
p [1].subsets # => [[], [1]]
p [1, 2].subsets # => [[], [1], [2], [1, 2]]
p [1, 2, 3].subsets # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
