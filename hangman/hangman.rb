end_game = false

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

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end

new_status = {
  remaining_guesses: 5,
  wrong_guesses: 0,
  word: ramdon_word(dictionary).split(""),
  guessed_letters: [],
  right_guesses: []
}

current_status = deep_copy(new_status)

# Game loop
until end_game
  puts "What would you like to do? Type 'exit' to quit end the game, Type 'save' to save the game and quit or type a single letter to continue with the game"
  input = gets.chomp.downcase

  if input == "exit"
    puts "Thanks for playing, see you next time!"
    end_game = true
  elsif input == 'save'
    puts "Saving game, see you next time!"
    end_game = true
  elsif input.length == 1 && input.match(/[a-z]/)
    puts "valid guess"
  else
    puts "Invalid input please try again"
  end
end
