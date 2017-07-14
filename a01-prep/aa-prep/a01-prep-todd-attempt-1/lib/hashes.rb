#### Hashes ####

class Hash

  def my_each(&prc)
    result = Hash.new
    self.keys.each do |k|
      result[k] = prc.call(k, self[k])
    end
    result
  end

  def my_merge(hash2)
    result = Hash.new
    self.my_each do |k, v|
      result[k] = v
    end
    hash2.my_each do |k, v|
      result[k] = v
    end
    result
  end

end
