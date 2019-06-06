=begin 

given an array, find the peak(s) and do not
  include the ends in your results

so long as the ends of the array are not
the same as a given peak, I think it is safe to
say that it is a peak

go through the array
if the next value (not an end or start index)
goes up and the next index after that one goes down, it's
a peak

we should start iterating at index 1
dont include the start or end as elements

if the curr element is higher than the previous and lower than
the next, it is a peak.

if the curr element is higher than the previous and equal to the
next, it may be a peak. in this case we need to iterate 
through the rest of the array starting from curr_idx as 0.
  - slice
  - if next idx is greater than 0 value, return false
  - after getting through the whole slice, if once we arrive
  at index -1 and it is the same as the starting index value,
  return false
  - otherwise, return true


=end

def pick_peaks(arr)
  peaks = []

  arr.map.with_index do |ele, idx| 
    next if idx.zero? || idx == arr.size - 1
    peaks << idx if is_peak?(ele, idx, arr)
  end

  peaks.select! do |idx|
    curr_slice = arr.slice(idx...arr.size)
    real_peak?(curr_slice) 
  end
  
  peak_values = peaks.map { |idx| arr[idx] }
  result = { 'pos' => peaks, 'peaks' => peak_values }
end

def is_peak?(element, index, array)
  element > array[index - 1] && element >= array[index + 1]
end

def real_peak?(slice)
  poss_peak = slice.first

  slice.each_with_index do |ele, idx|
    next if idx.zero? 
    return false if poss_peak < slice[idx]
    return true if poss_peak > slice[idx]
  end

  poss_peak <= slice[slice.size - 1] ? false : true
end

arr1 = [2,1,3,1,2,2,2,2,1]
arr2 = [2,1,3,1,2,2,2,2,2]
arr3 = [1,2,3,6,4,1,2,3,2,1]
arr4 = [2, -4, 14, 11, -5, 8, -3, 18, -5, 6, 18, 18, -5, 6, 2, 5, 13, -3, 20, 0, -4]

p pick_peaks(arr4)