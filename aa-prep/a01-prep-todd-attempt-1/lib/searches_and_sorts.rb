#### Searches && Sorts ####

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    sorted = false

    until sorted
      sorted = true
      self.each_with_index do |el, idx|
        next if idx + 1 == self.length
        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    arr = self.dup
    arr.bubble_sort!(&prc)
  end

  def merge_sort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return self if self.length < 2

    mid = self.length / 2
    left = self.take(mid)
    right = self.drop(mid)
    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)
    self.class.merge(left_sorted, right_sorted, &prc)
  end

  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 0
        result << left.shift
      when -1
        result << left.shift
      else
        result << right.shift
      end
    end
    result + left + right
  end

  def my_quick_sort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return self if self.length < 2

    pivot = self.last

    less_than_pivot = self.select { |el| prc.call(el, pivot) == -1 }
    equal_to_pivot = self.select { |el| prc.call(el, pivot) == 0 }
    greater_than_pivot = self.select { |el| prc.call(el, pivot) == 1 }

    less_than_pivot_sorted = less_than_pivot.my_quick_sort(&prc)
    greater_than_pivot_sorted = greater_than_pivot.my_quick_sort(&prc)

    less_than_pivot_sorted + equal_to_pivot + greater_than_pivot_sorted
  end

  def my_bsearch(target, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return nil if self.empty?

    mid = self.length / 2

    case prc.call(self[mid], target)
    when 0
      return mid
    when 1
      self.take(mid).my_bsearch(target, &prc)
    else
      result = self.drop(mid + 1).my_bsearch(target, &prc)
      result.nil? ? nil : mid + 1 + result
    end
  end
end
