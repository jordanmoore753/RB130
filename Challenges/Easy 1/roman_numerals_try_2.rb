class Integer
  def to_roman
    roman_hash = populate_roman_hash
    number = self
    roman_number = ''

    roman_hash.each do |key, value|
      letter_frequency, number = number.divmod(value)
      roman_number += key * letter_frequency
    end

    roman_number
  end

  def populate_roman_hash
    roman_nums = %w(I IV V IX X XL L XC C CD D CM M).reverse
    dec_equivalents = [1, 4, 5, 9, 10, 40, 50,
                       90, 100, 400, 500, 900,
                       1000].reverse

    Hash[roman_nums.zip(dec_equivalents)]
  end
end
