class Array

  def bubblesort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    sorted = false

    until sorted
      sorted = true

      self.each_index do |idx|
        next if idx + 1 == self.length

        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
          sorted = false
        end

      end

    end
    self

  end

end
