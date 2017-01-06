module BookKeeping
  VERSION = 2
end

class Fixnum

  def to_roman
    string_of_digits = self.to_s
    level = string_of_digits.size - 1
    roman = ''

    string_of_digits.each_char do |digit|
      roman << RomanNumeralDefault.for(level, digit.to_i).numeral
      level -= 1
    end

    return roman
  end

  class RomanNumeralDefault
    ROMAN_NUMERALS = %w(I V X L C D M)
    ROMAN_NUMERALS_BY_LEVEL = [
        ROMAN_NUMERALS[0..2], # I V X
        ROMAN_NUMERALS[2..4], # X L C
        ROMAN_NUMERALS[4..6], # C D M
        ROMAN_NUMERALS[6..6], # M
    ]

    attr_reader :level, :digit, :level_numerals

    def self.for(level, digit)
      begin
        self.const_get("RomanNumeral#{digit}")
      rescue NameError
        digit < 4 ? RomanNumeralBefore4 : RomanNumeralDefault
      end.new(level, digit)
    end

    def initialize(level, digit)
      @level = level
      @digit = digit
      @level_numerals = ROMAN_NUMERALS_BY_LEVEL[level]
    end

    def base
      level_numerals[1]
    end

    def modifier
      level_numerals[0]
    end

    def next_modifier
      level_numerals[2]
    end

    def numeral
        "#{base}#{modifier * (digit - 5)}"
    end

    class RomanNumeralBefore4 < RomanNumeralDefault
      def numeral
        modifier * digit
      end
    end

    class RomanNumeral4 < RomanNumeralDefault
      def numeral
        "#{modifier}#{base}"
      end
    end

    class RomanNumeral5 < RomanNumeralDefault
      def numeral
        base
      end
    end

    class RomanNumeral9 < RomanNumeralDefault
      def numeral
        "#{modifier}#{next_modifier}"
      end
    end
  end
end