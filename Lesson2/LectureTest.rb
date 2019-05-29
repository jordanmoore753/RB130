require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
    @car2 = Car.new
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_car_exists
    assert(@car)
  end

  def test_car_name
    assert_nil(@car.name)
  end

  def test_arguments
    assert_raises(ArgumentError) do 
      Car.new(name: 'Joey')
    end
  end

  def test_instance_of
    assert_instance_of(Car, @car)
  end

  def assert_includes
    arr = []
    arr << @car 
    assert_includes(arr, @car)
  end

  def test_name_equality
    setup

    @car.name = 'Kim'
    @car2.name = 'Kim'

    assert_equal(@car, @car2)
  end
end