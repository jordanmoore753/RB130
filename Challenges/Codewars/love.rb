

def how_much_i_love_you(nb_petals)
  strings = ['I love you', 'a little', 'a lot',
             'passionately', 'madly', 'not at all']

  strings[nb_petals % 6 - 1]
end

p how_much_i_love_you(7)
