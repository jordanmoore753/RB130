class Crypto
  def initialize(text)
    @normalized_plaintext = text.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def normalize_plaintext
    @normalized_plaintext
  end

  def size
    plain_text_size = normalize_plaintext.size
    Math.sqrt(plain_text_size).ceil
  end

  def plaintext_segments
    @normalized_plaintext.scan(/.{1,#{size}}/)
    #@normalized_plaintext.chars.each_slice(size).to_a.map(&:join)
  end

  def ciphertext
    encode(plaintext_segments).join
  end

  def right_pad(str, limit)
    return str if str.length == limit
    str += ' ' * (limit - str.length)
  end

  def strip_sub_arr(sub_arr)
    sub_arr.join.rstrip
  end

  def normalize_ciphertext
    encode(plaintext_segments).join(' ')
  end

  def encode(segments)
    padded_segments = segments.map do |string|
      right_pad(string, size)
    end

    padded_segments.map(&:chars).transpose.map { |string| strip_sub_arr(string) }
  end
end

crypto = Crypto.new('I am')
p crypto.normalize_ciphertext

