require 'byebug'

class Array

  def bsearch(target)
    debugger
    return nil if self.length == 0

    mid = self.length / 2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      self.take(mid).bsearch(target)
    else
      result = self.drop(mid + 1).bsearch(target)
      result.nil? ? nil : mid + 1 + result
    end

  end

end
