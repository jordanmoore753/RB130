require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EqualityTest < Minitest::Test 
  def test_value_equality
    num1 = 'hi'
    num2 = 'hi'

    assert_equal(num1, num2)
  end
end