class Triangle
  def initialize(number)
    @number = number
  end

  def rows
    return [[1]] if number == 1
    return [[1], [1, 1]] if number == 2

    arra = [[1], [1, 1]]
    iteration_track = 2

    until iteration_track >= number
      add_row(arra)
      iteration_track += 1
    end

    arra
  end

  private

  attr_reader :number

  def add_row(array)
    size_arr, curr_element = array.size, 1
    size_arr += 1
    array << Array.new(size_arr)

    array.last[0] = 1
    array.last[-1] = 1
    
    until !array.last.any? { |ele| ele.nil? }
      array.last[curr_element] = array[size_arr - 2][curr_element - 1] + array[size_arr - 2][curr_element]
      curr_element += 1
    end
  end
end

# REFACTOR WITH EACH_CONS




