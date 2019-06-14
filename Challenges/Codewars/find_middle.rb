=begin 

find element that is the middle of 
the entire array when sorted


=end



def gimme(input_array)
  middle = input_array.sort[1]
  input_array.index(middle)
end

