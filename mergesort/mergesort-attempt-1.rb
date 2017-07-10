class Array

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

  private

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

end
