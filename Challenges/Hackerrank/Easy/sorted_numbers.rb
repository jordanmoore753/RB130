def bigSorting(unsorted)
  unsorted.map!(&:to_i).sort
end

a = ["31415926535897932384626433832795", "1", "3", "10", "3", "5"]
p bigSorting(a)

