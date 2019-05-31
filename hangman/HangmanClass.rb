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
