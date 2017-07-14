#### Strings ####

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
  array = title.split(" ")
  blacklist = %w(a and of over the)
  result = []
  array.each do |el|
    result << el.capitalize unless blacklist.include? el
    result << el if blacklist.include? el
  end
  result[0] = result[0].capitalize
  result.join(" ")
end

# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def translate(sentence)
  array = sentence.split(" ")
  array.map! { |el| el = first_to_last(el) + "ay" }
  array.join(" ")
end

def first_to_last(str)
  vowels = %w(a e i o u)
  doubles = %w(ch th qu br)
  triples = %w(sch squ thr)
  if triples.include?(str[0..2])
    return str[3..-1] + str[0..2]
  end
  if doubles.include?(str[0..1])
    return str[2..-1] + str[0..1]
  end
  unless vowels.include?(str[0])
    str = str[1..-1] + str[0]
  end
  str
end

# Write a method that caesar shifts a string by a number of shifts
# You can ssume all characters are lowercase
def caesar_cipher(str, shift)
  str.each_char.with_index do |ch, idx|
    next if ch == " "
    str[idx] = number_to_letter((letter_to_number(ch) + shift))
  end
  str
end

def letter_to_number(str)
  str.ord - 96
end

def number_to_letter(num)
  ((num % 26) + 96).chr
end

# Write a method that sorts the characters in a string according to the order of an alphabet array
# Use alphabetical order by default if an alphabet is not provided
def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a
  hsh = Hash.new(0)
  str.each_char { |ch| hsh[ch] += 1 }
  result = ""
  alphabet.each do |ch|
    hsh[ch].times { result += ch }
  end
  result
end

class String

  # Write a method that returns all subwords within a string that are included in a dictionary array
  def real_words_in_string(dictionary)
    substrs = self.substrings
    substrs.select { |el| dictionary.include?(el) }
  end

  def substrings
    idx = 0
    jdx = 0
    result = []
    while idx < self.length

      while jdx < self.length
        result << self[idx..jdx]
        jdx += 1
      end
      idx += 1
      jdx = idx
    end
    result.uniq
  end

  # Write a method that returns all substrings that are also palindromes
  def symmetric_substrings
    substrs = self.substrings
    substrs.select { |el| el.length > 1 && el == el.reverse }
  end

end
