#### Arrays ####

class Array
  # Write a method that returns an array of all of the pairs of indexes whose
  # elements sum to zero
  def two_sum
    idx = 0
    jdx = 1
    result = []
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

  # Write a method that returns a hash containing any repeating elements as keys
  # with the values set to an array of the indexes of each repeat
  def dups
    hsh = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |el, idx|
      hsh[el] << idx
    end
    hsh.select { |k, v| v.length > 1 }
  end

  # Write a method that returns the sum of all elements in the array
  def sum
    self.inject(0) { |acc, rec| acc + rec }
  end

  # Write a method that squares each element in the array
  def square!
    arr = self.map{ |el| el ** 2 }
    self.each_index { |idx| self[idx] = arr[idx] }
  end

  # Write a method that squares each element in the array, but does not modify the array
  def square
    arr = self.dup
    arr.square!
  end

  # Write a method that returns all of the unique elements in an array
  def my_uniq
    result = []
    self.each { |el| result << el unless result.include? el}
    result
  end

  # Write a method that tranposes an array (see Array#transpose)
  def my_transpose
    result = Array.new(self.first.length) { [] }
    self.first.each_with_index do |el1, idx|
      result[idx] << el1
      self.drop(1).each do |el2|
        result[idx] << el2[idx]
      end
    end
    result
  end

  # Write a method that returns the median of elements in an array
  # If the length is even, return the average of the middle two elements
  def median
    return nil if self.length == 0
    sorted = self.sort
    mid = self.length / 2
    self.length.even? ? (sorted[mid - 1]  + sorted[mid])/2.0 : sorted[mid]
  end
end
