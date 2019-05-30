require 'minitest/autorun'

require_relative 'cat.rb'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty', 5)
  end

  def test_is_cat; end

  def test_name
    setup
    assert_equal(@kitty.name, 'Milo')
  end

  def test_miaow
    assert_includes(@kitty.miaow, ' is miaowing.')
  end

  def test_raises_error
    assert_raises(ArgumentError) do
      Cat.new
    end
  end

  def test_is_not_purrier
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)

    refute(patch.purr_factor > milo.purr_factor)
  end
end