def angryProfessor(k, a)
  a.count { |i| i <= 0 } >= k ? 'YES' : 'NO'
end

p angryProfessor(3, [-1, -3, 4, 2])