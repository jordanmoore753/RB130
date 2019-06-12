def sequence_sum(begin_number, end_number, step)
  return 0 if begin_number > end_number
  numbers = [begin_number]

  until numbers.last + step > end_number
    numbers << numbers.last + step
  end

  numbers.reduce(:+)
end

p sequence_sum(2, 6, 2)