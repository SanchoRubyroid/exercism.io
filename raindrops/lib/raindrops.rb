module BookKeeping
  VERSION = 3
end

class Raindrops
  FACTOR_WORD_MAP = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
  }

  def self.convert(drops)
    converted_drops = String.new

    FACTOR_WORD_MAP.each do |factor, word|
      converted_drops += self.new(drops, factor, word).to_s
    end

    converted_drops = drops.to_s if converted_drops.empty?

    return converted_drops
  end

  def initialize(drops, factor, word)
    @drops = drops
    @factor = factor
    @word = word
  end

  def to_s
    (@drops % @factor == 0 ? @word : '')
  end
end
