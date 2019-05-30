require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class AllTest < MiniTest::Test 
  def setup
    @one = 1
    @str = 'XYZ'
  end

  def test_bool
    setup
    assert_equal(true, @one.odd?)
  end

  def test_str_downcase
    setup
    assert_equal('xyz', @str.downcase)
  end
end