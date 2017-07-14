#### Enumerables ####

# Write a method that returns an array of all factors of a number
def factors(num)
  (1..num).select { |el| num % el == 0 }
end

# Write a method that doubles each element in an array
def doubler(array)
  array.map { |el| el + el }
end

# Write a method that returns an array of the first n number of primes numbers
def primes(n)
  result = []
  idx = 2
  while result.length < n
    result << idx if is_prime?(idx)
    idx += 1
  end
  result
end

def is_prime?(n)
  (2...n).none? { |el| n % el == 0 }
end

class Array

  def my_each(&prc)
    idx = 0
    result = []
    while idx < self.length
      result << prc.call(self[idx])
      idx += 1
    end
    result
  end

  def my_each_with_index(&prc)
    idx = 0
    result = []
    while idx < self.length
      result << prc.call(self[idx], idx)
      idx += 1
    end
    result
  end

  def my_select(&prc)
    result = []
    self.my_each { |el| result << el if prc.call(el) }
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each { |el| result << el unless prc.call(el) }
    result
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    return false
  end

  def my_all?(&prc)
    self.my_each { |el| return false unless prc.call(el) }
    return true
  end

  def my_flatten
    return self if !self.any? { |el| el.is_a? Array }
    result = []
    self.my_each do |el|
      result << el unless el.is_a? Array
      result += el.my_flatten if el.is_a? Array
    end
    result
  end

  # Write a version of flatten that only flattens n levels of an array.
  def my_controlled_flatten(n)
    return self if n == 0
    result = []
    self.my_each do |el|
      result << el unless el.is_a? Array
      result += el.my_controlled_flatten(n - 1) if el.is_a? Array
    end
    result
  end

  def my_zip(*arrs)
    result = Array.new(self.length) { [] }
    self.my_each_with_index do |el1, idx|
      result[idx] << el1
      arrs.each do |el2|
        result[idx] << el2[idx]
      end
    end
    result
  end

  def my_rotate(num=1)
    offset = num % self.length
    self.drop(offset) + self.take(offset)
  end

  def my_join(str = "")
    result = ""
    self[0...-1].my_each do |el|
      result += el
      result += str
    end
    result += self.last
    result
  end

  def my_reverse
    result = []
    self.my_each { |el| result.unshift(el) }
    result
  end

end
