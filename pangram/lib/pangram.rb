module BookKeeping
  VERSION = 3
end

class Pangram
  ASCII_ALPHABET = (97..122).to_a.freeze

  def self.pangram?(phrase)
    phrase.downcase.each_byte.select{|ascii_char| ASCII_ALPHABET.include?(ascii_char)}.uniq.sort == ASCII_ALPHABET
  end
end