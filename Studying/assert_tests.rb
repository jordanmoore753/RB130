require 'minitest/autorun'

class Car < MiniTest::Test 
  def test_exist
    a = 1
    assert(a)
  end

  def test_nil
    b = nil 
    assert_nil(b)
  end

  def test_raise_error
    a = [1, 2, nil]
    assert_raises(TypeError) { a.first + 'two' }
  end

  def test_instance_of
    a = 1
    assert_instance_of(Integer, a)
  end

  def test_assert_includes
    a = [1, 2]
    assert_includes(a, 1)
  end
end