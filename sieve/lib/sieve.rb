module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize(limit)
    @base_range = (2..limit).to_a
    @primes = []
  end

  def primes
    first_number = @base_range.shift
    return @primes if first_number.to_i < 2

    drop_multipliers(first_number, @base_range)

    @primes
  end

  def drop_multipliers(prime, range)
    @primes << prime
    range_dropped_multipliers = range.reject { |test_number| test_number%prime == 0 }

    if range_dropped_multipliers == range
      @primes += range_dropped_multipliers
    else
      drop_multipliers(range_dropped_multipliers.shift, range_dropped_multipliers)
    end
  end
end