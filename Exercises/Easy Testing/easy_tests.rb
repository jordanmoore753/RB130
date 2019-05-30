require 'minitest/autorun'


class AllTest < MiniTest::Test 
  class NoExperienceError < StandardError
  end

  class Employee
    def hire
      raise NoExperienceError
    end
  end

  def setup
    @one = 1
    @str = 'XYZ'
    @none = nil
    @arr = []
    @list = ['xyz']
    @obj = Employee.new
  end

  def test_bool
    setup
    assert_equal(true, @one.odd?)
  end

  def test_str_downcase
    setup
    assert_equal('xyz', @str.downcase)
  end

  def test_nil
    setup
    assert_nil(@none)
  end

  def test_empty_arr
    setup
    assert_equal(true, @arr.empty?)
    # or assert_empty(@arr)
  end

  def test_arr_str
    setup
    assert_includes(@list, 'xyz')
  end

  def test_hire_exception
    setup
    assert_raises NoExperienceError do 
      @obj.hire
    end
  end

  def test_numeric_class
    setup
    #assert_instance_of Numeric, @one
  end

  def test_numeric_or_subclass
    setup
    assert_kind_of Numeric, @one
  end

  def test_diff_obj
    #assert_same(@list, @list.process)
  end

  def test_arr_includes
    setup
    #refute_includes(@list, 'xyz')
  end
end