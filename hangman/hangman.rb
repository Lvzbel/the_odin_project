puts "Game has started"

# Load and convert txt file into an array
dictionary_txt = File.read "5desk.txt"
dictionary = dictionary_txt.split(/\n/)

# Select a ramdon word between 5 and 12 chars long
def ramdon_word(words_array)
  random_number = rand(0..words_array.length)
  word = words_array[random_number].gsub!(/\r/, "")
  p word
  if word.length >= 5 && word.length <= 12
    return word.downcase
  else
    puts "Looking for another word"
    ramdon_word(words_array)
  end
end 

p ramdon_word(dictionary)
