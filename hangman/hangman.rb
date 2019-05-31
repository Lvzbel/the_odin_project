require 'set'
require "yaml"
require_relative "HangmanClass"
require_relative "ramdon_word"

system 'clear'
end_game = false
saved_game = "gamesave.txt"

# Load and convert txt file into an array
dictionary_txt = File.read "5desk.txt"
dictionary = dictionary_txt.split(/\n/)

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