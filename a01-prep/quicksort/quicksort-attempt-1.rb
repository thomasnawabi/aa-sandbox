class Array

  def quicksort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return self if self.length < 2

    pivot = self.last
    less_than_pivot = self.select { |el| prc.call(el, pivot) == -1 }
    equal_to_pivot = self.select { |el| prc.call(el, pivot) == 0 }
    greater_than_pivot = self.select { |el| prc.call(el, pivot) == 1 }
    less_than_pivot_sorted = less_than_pivot.quicksort(&prc)
    greater_than_pivot_sorted = greater_than_pivot.quicksort(&prc)

    less_than_pivot_sorted + equal_to_pivot + greater_than_pivot_sorted    
  end

end
