module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(target_prime_element_number)
    raise ArgumentError if target_prime_element_number == 0
    Prime.new(target_prime_element_number).prime
  end

  def initialize(target_prime_element_number)
    @target_prime_element_number = target_prime_element_number
    @primes = [2]
    @counter = 2
  end

  def prime
    while prime_not_found? do
      @counter += 1
      @primes << @counter unless @primes.any? { |prime| @counter % prime == 0 }
    end

    @primes.last
  end

  def prime_not_found?
    @primes.size != @target_prime_element_number
  end
end