class Array

  def deep_dup
    result = []
    self.each do |el|
      if el.is_a? Array
        result << el.deep_dup
      else
        result << el
      end
    end
    result
  end

end
