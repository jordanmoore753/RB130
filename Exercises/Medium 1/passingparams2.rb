def method(arr)
  yeah = yield(arr)
  p yeah
end

method(%w(raven finch hawk eagle)) { |_, _, *raptors| raptors }