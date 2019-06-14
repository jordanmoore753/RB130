class Array
  def contains_all?(other_array)
    self.all? { |element| other_array.include?(element) }
  end
end

p [1,2,3,4,5,6,7,8,9,10].contains_all?([1,2,3,4,5])