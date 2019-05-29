class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(obj)
    obj.is_a?(Car) && name == obj.name
  end
end
