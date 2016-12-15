module BookKeeping
  VERSION = 5
end

class Gigasecond
  def self.from(start_time)
    start_time + 1_000_000_000
  end
end