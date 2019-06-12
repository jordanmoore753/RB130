def encrypt_this(text)
  text.split(' ').map do |word|
    word[1], word[-1] = word[-1], word[1] if word.length > 1
    word[0] = word[0].ord.to_s
    word
  end.join(' ')
end

p encrypt_this('Hello world')