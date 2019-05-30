def zip(arr, arr2)
  unless arr.instance_of?(Array) && arr2.instance_of?(Array)
    raise TypeError, 'Argument must be array.'
  end

  counter = 0
  results = []

  while counter < arr.size
    results << [arr[counter], arr2[counter]]
    counter += 1
  end

  results
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]