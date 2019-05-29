def call_me(code)
  code.call
end

fav_num = 34
code_chunk = Proc.new { puts "me num is #{fav_num}."}
fav_num = 38


call_me(code_chunk)