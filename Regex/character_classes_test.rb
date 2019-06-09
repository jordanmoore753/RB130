class Clock
  attr_accessor :total_minutes, :hour, :minutes

  def initialize(hour, minutes)
    hour = 24 if hour.zero?
    self.total_minutes = (60 * hour) + minutes
  end

  def self.at(hour = 0, minutes = 0)
    Clock.new(hour, minutes)
  end

  def -(int)
    @total_minutes -= int
    self
  end

  def +(int)
    @total_minutes += int
    self
  end

  def ==(other_obj)
    self.to_s == other_obj.to_s
  end

  def to_s
    hours, minutes = total_minutes.divmod(60)
    hours = hours % 24 if hours >= 24 
    "#{format('%02d', hours)}:#{format('%02d', minutes)}"
  end
end