arr = [1, 2, 3, 4, 5]

arr.map(&:to_s)
ints = arr.select(&:odd?)

p ints

arr2 = ['hello', 'jim']

arr2.map(&:upcase!)

p arr2

# chunk = Proc.new { |val| val.to_s }

# arr.map!(&:chunk)

p arr

# :to_s => to_s => { |val| val.to_s }

def time_it
  lo = 'yeah'
  ho = 'hooo'
  yield(lo)
end

time_it { |one, two| puts one, two}

