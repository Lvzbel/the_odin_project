require 'set'
require "yaml"

system 'clear'
end_game = false
saved_game = "gamesave.txt"

# ====================================
# Dictionary
# ====================================

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

# ====================================
# Hangman Class
# ====================================
class Hangman
  attr_accessor :word, :wrong_guesses, :guessed_letters, :remaining_guesses
  # attr_reader 

  def initialize(word, remaining_guesses = 5)
    @word = word
    @remaining_guesses = remaining_guesses
    @wrong_guesses = []
    @guessed_letters = []
  end

  def render_game_score
    display = ""
    @word.each do |letter|
      @guessed_letters.include?(letter) ? display << letter : display << "_"
    end
    display
  end

  def render_wrong_guesses
    display = ""
    @wrong_guesses.map do |letter|
      display << "#{letter}  "
    end
    display
  end

  def game_won?
    @word.to_set == @guessed_letters.to_set
  end

  def game_lost?
    @remaining_guesses == 0
  end

  def save_game
    data = {
      remaining_guesses: @remaining_guesses,
      wrong_guesses: @wrong_guesses,
      word: @word,
      guessed_letters: @guessed_letters
    }
    File.open("gamesave.txt", 'w') do |file|
      file.puts data.to_yaml
    end
  end

  def load_game
    saved_status = File.read "gamesave.txt"
    data = YAML.load(saved_status)
    @remaining_guesses = data[:remaining_guesses]
    @wrong_guesses = data[:wrong_guesses]
    @word = data[:word]
    @guessed_letters = data[:guessed_letters]
  end

  def wrong_guess
    @remaining_guesses -= 1
  end

  def summit_guess(input)

    if @word.include?(input)
      @guessed_letters << input
    elsif !@wrong_guess.include?(input)
      @wrong_guesses << input
      self.wrong_guess
    end
  end

  def reset(word)
    @word = word
    @remaining_guesses = 5
    @wrong_guesses = []
    @guessed_letters = []
  end

end

# ====================================
# Game Loop
# ====================================
game = Hangman.new(ramdon_word(dictionary).split(""))

if File.exists?(saved_game)
  puts "Would you like to load your game saved? Y/N"
  answer = gets.chomp.downcase
  if answer == "y"
    current_status = game.load_game
  end
end

until end_game
  # system 'clear'
  p game.word
  puts "What would you like to do? Type 'exit' to quit end the game, Type 'save' to save the game and quit or type a single letter to continue with the game \n"
  puts "Scoreboard: #{game.render_game_score}   Tries: #{game.remaining_guesses}"
  puts "Wrong guesses: #{game.render_wrong_guesses}"
  input = gets.chomp.downcase

  if input == "exit"
    puts "Thanks for playing, see you next time!"
    end_game = true
  elsif input == 'save'
    game.save_game
    puts "Saving game, see you next time!"
    end_game = true
  elsif input.length == 1 && input.match(/[a-z]/)
    game.summit_guess(input)
  else
    puts "Invalid input please try again"
  end

  # Determined if the game has been won or lost
  if game.game_won?
    puts "You Won!"
    end_game = true
  end
  if game.game_lost?
    puts "Game Over"
    end_game = true
  end
end