module BookKeeping
  VERSION = 3
end

class Squares
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def difference
    return square_of_sum - sum_of_squares
  end

  def square_of_sum
    (1..limit).inject(0) { |sum, number| sum + number } ** 2
  end

  def sum_of_squares
    (1..limit).inject(0) { |sum, number| sum + number ** 2 }
  end
end