# Extended enumerable to include standard deviation

module Enumerable
  def sum
    inject(:+)
  end

  def mean
    (sum / length).to_f
  end

  def variance
    avg = mean
    sum = inject(0) { |accum, el| accum + (el - avg)**2 }
    (sum / length).to_f
  end

  def std_deviation
    Math.sqrt(variance)
  end
end
