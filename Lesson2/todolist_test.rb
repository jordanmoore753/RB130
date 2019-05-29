require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test 
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]  


    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    setup
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    setup
    assert_equal(3, @list.size)
  end

  def test_first
    setup
    assert_equal(@todo1, @list.first)
  end

  def test_last
    setup
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    setup
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    setup
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    setup
    assert_equal(false, @list.done?)
  end

  def test_add_wrong_item
    setup
    assert_raises(TypeError) { @list.add('string')}
    assert_raises(TypeError) { @list.add(1)}
    assert_raises(TypeError) { @list.add([])}
  end

  def test_shovel_operator
    setup
    new_todo = Todo.new('Fresh chore')
    @todos << new_todo
    @list << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add_operator
    setup
    new_todo = Todo.new('Fresh chore')
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    setup
    assert_raises(IndexError) { @list.item_at(3)}
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    setup
    assert_raises(IndexError) { @list.mark_done_at(7) }
    @list.mark_done_at(2)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_unmark_done_at
    setup
    assert_raises(IndexError) { @list.mark_undone_at(7) }

    @list.mark_all_done
    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    setup
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    setup
    assert_raises(IndexError) { @list.remove_at(7) }

    @list.remove_at(1)

    assert_equal(@todo1, @list.to_a[0])
    assert_equal(@todo3, @list.to_a[1])
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    @list.mark_done_at(1)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    @list.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    arr = []
    setup
    @list.each { |todo| arr << todo }

    assert_equal(arr, @list.to_a)
  end

  def test_each_return_val
    setup
    assert_equal(@list.each { |obj| nil }, @list.current_obj)
  end

  def test_select
    setup
    @list.mark_done_at(2)
    selected_trues = @list.select { |todo| todo.done? }

    assert_equal(@list.to_a[2], selected_trues.first)

    selected_falses = @list.select { |todo| !todo.done? }

    assert_equal([@todo1, @todo2], selected_falses.to_a)
  end
end