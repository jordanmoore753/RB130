class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(task)
    raise TypeError, 'can only add Todo objects' unless task.instance_of? Todo

    todos << task
  end

  alias_method :add, :<<

  def current_obj
    self
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    current_obj
  end

  def select
    new_list = TodoList.new('Updated List')

    each do |todo|
      new_list.add(todo) if yield(todo)
    end

    new_list
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def done!
    each { |todo| todo.done! }
  end

  def check_range(value)
    poss_idx = (0...todos.size).to_a
    raise IndexError if !poss_idx.include?(value)
  end

  def item_at(idx)
    check_range(idx)

    puts todos[idx]
  end

  def mark_done_at(idx)
    check_range(idx)

    todos[idx].done!
  end

  def mark_undone_at(idx)
    check_range(idx)

    todos[idx].undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    check_range(idx)

    todos.delete_at(idx)
  end

  def to_s
    puts "----- #{title} -----"
    each { |todo| puts todo }
  end

  def find_by_title(str)
    select { |todo| todo.title == str }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| todo.done? == false }
  end

  def mark_done(str)
    find_by_title(str) && find_by_title(str).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new('Today')
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.mark_done_at(1)
list.mark_done('Buy milk')


p list.all_done