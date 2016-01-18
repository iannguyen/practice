module Enumerable
  def sum
    self.inject(:+)
  end

  def mean
    (self.sum/self.length).to_f
  end

  def variance
    avg = self.mean
    sum = self.inject(0) { |accum, el| accum + (el - avg)** 2 }
    (sum/self.length).to_f
  end

  def std_deviation
    Math.sqrt(self.variance)
  end
end
