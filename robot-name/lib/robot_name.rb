module BookKeeping
  VERSION = 2
end

class Robot
  attr_reader :name

  @@previous_names = []

  def initialize
    reset
  end

  def reset
    generate_name
    @@previous_names.include?(name) ? reset : (@@previous_names << name)
  end

  def generate_name
    @name = String.new

    2.times { @name << (rand(25) + 65).chr }
    @name << (rand(899) + 100).to_s
  end
end