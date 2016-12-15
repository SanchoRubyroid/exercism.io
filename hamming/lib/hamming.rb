module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.size != strand2.size

    hamming_distance = 0
    strand1.each_char.with_index do |cell, index|
      hamming_distance += 1 if cell != strand2[index]
    end

    hamming_distance
  end
end