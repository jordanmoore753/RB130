require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'iteratorsall.rb'

class AllTest < MiniTest::Test 
  def setup
    @arr1 = [1, 3, 5, 6]
    @arr2 = [1, 3, 5, 7]
    @arr3 = []
  end

  def test_empty_arr
    all?([]) { |value| false } == true
  end

  def test_not_all
    all?(@arr2) { |value| value.odd? } == false
  end

  def test_all_true
    all?(@arr1) { |value| value.odd? } == true
  end
end