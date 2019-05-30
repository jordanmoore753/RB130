def step(start, ending, step)
  results = []

  while start <= ending
    yield(start)
    start += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# A return value of nil works just fine here.