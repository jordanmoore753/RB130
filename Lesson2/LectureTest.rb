require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test 
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_car_name
    car = Car.new
    assert_nil(car.name)
  end

  def test_arguments
    assert_raises(ArgumentError) do 
      car = Car.new(name: 'Joey')
    end
  end

  def test_instance_of
    car = Car.new
    assert_instance_of(Car, car)
  end

  def assert_includes
    arr = []
    car = Car.new
    arr << car 
    assert_includes(arr, car)
  end
end