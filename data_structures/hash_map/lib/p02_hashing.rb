class Fixnum
  # implemented
end

# Custom hash methods
class Array
  def hash
    each_with_index.inject(0) do |intermediate_hash, (el, idx)|
      (el.hash + idx.hash) ^ intermediate_hash
    end
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  def hash
    to_a.sort_by(&:hash).hash
  end
end
