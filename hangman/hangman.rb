end_game = true

# Load and convert txt file into an array
dictionary_txt = File.read "5desk.txt"
dictionary = dictionary_txt.split(/\n/)

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

new_status = {
  remaining_guesses: 5,
  wrong_guesses: 0,
  word: ramdon_word(dictionary).split(""),
  guessed_letters: []
}

p new_status[:word]

# Game loop
until end_game
  puts "Hello"
end
