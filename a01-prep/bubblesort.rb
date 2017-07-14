require 'byebug'

class Array

  def bsort(&prc)
    # debugger
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    sorted = false
    while !sorted
      sorted = true
      self.each_index do |idx|
        next if self[idx + 1] == nil || prc.call(self[idx], self[idx + 1]) < 1
        self[idx], self[idx + 1] = self[idx + 1], self[idx]
        sorted = false
      end
    end
    self
  end

end
