# ====================================
# Ramdon Word
# ====================================

# Select a ramdon word between 5 and 12 chars long 
def ramdon_word(words_array)
  random_number = rand(0..words_array.length)
  word = words_array[random_number].gsub!(/\r/, "")
  if word.length >= 5 && word.length <= 12
    return word.downcase
  else
    ramdon_word(words_array)
  end
end