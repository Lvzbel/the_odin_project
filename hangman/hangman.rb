require 'set'
require "yaml"

system 'clear'
end_game = true
saved_game = "gamesave.txt"

# Load and convert txt file into an array
dictionary_txt = File.read "5desk.txt"
dictionary = dictionary_txt.split(/\n/)

class Hangman
  attr_accessor :word, :wrong_guesses, :guessed_letters
  attr_reader :remaining_guesses

  def initialize(word, remaining_guesses = 5)
    @word = word
    @remaining_guesses = remaining_guesses
    @wrong_guesses = []
    @guessed_letters = []
  end

end

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
  wrong_guesses: [],
  word: ramdon_word(dictionary).split(""),
  guessed_letters: []
}

def render_game_score(secret_word_array, guesses_array)
  display = ""
  secret_word_array.each do |letter|
    guesses_array.include?(letter) ? display << letter : display << "_"
  end
  display
end

def render_wrong_guesses(guess_array)
  display = ""
  guess_array.map do |letter|
    display << "#{letter}  "
  end
  display
end

def save_game(status_hash)
  data = status_hash.to_yaml
  File.open("gamesave.txt", 'w') do |file|
    file.puts data
  end
end

def load_game()
  saved_status = File.read "gamesave.txt"
  return YAML.load(saved_status)
end

current_status = deep_copy(new_status)

if File.exists?(saved_game)
  puts "Would you like to load your game saved? Y/N"
  answer = gets.chomp.downcase
  if answer == "y"
    current_status = load_game()
  end
end


# Game loop
until end_game
  # system 'clear'
  p current_status[:word]
  puts "What would you like to do? Type 'exit' to quit end the game, Type 'save' to save the game and quit or type a single letter to continue with the game \n"
  puts "Scoreboard: #{render_game_score(current_status[:word], current_status[:guessed_letters])}   Tries: #{current_status[:remaining_guesses]}"
  puts "Wrong guesses: #{render_wrong_guesses(current_status[:wrong_guesses])}"
  input = gets.chomp.downcase

  if input == "exit"
    puts "Thanks for playing, see you next time!"
    end_game = true
  elsif input == 'save'
    save_game(current_status)
    puts "Saving game, see you next time!"
    end_game = true
  elsif input.length == 1 && input.match(/[a-z]/)
    # Check if we already try this letter
    if current_status[:guessed_letters].include?(input) || current_status[:wrong_guesses].include?(input)
      puts "Duplicate guess, please try again"
      # If not a duplicate added to the guessed_letters array
    elsif current_status[:word].include?(input)
      current_status[:guessed_letters] << input
      # If the guess is wrong subtract one remaining guess
    else
      current_status[:remaining_guesses] -= 1
      current_status[:wrong_guesses] << input
    end
    
    # Determined if the game has been won or lost
    puts "word: #{current_status[:word].length}  guessed: #{current_status[:guessed_letters].length}"
    if current_status[:remaining_guesses] == 0
      end_game = true
      puts "Game Lost"
    elsif current_status[:word].to_set == current_status[:guessed_letters].to_set
      puts "Game Won"
      end_game = true
    end
  else
    puts "Invalid input please try again"
  end
end


# Class Testing
# remaining_guesses: 5,
# wrong_guesses: [],
# word: ramdon_word(dictionary).split(""),
# guessed_letters: []

player_one = Hangman.new(ramdon_word(dictionary).split(""))
p player_one.word
puts player_one.remaining_guesses
player_one.wrong_guesses << "benis"
p player_one.wrong_guesses
