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
    new_list = TodoList.new(title)

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

    todos[idx]
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
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
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

