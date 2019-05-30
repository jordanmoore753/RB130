class Series
  def initialize(str)
    @arr = str.split('').map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > arr.size
    arr.each_cons(n).to_a
  end

  private

  attr_reader :arr
end
