puts "Game has started"

# Load and convert txt file into an array
dictionary_txt = File.read "5desk.txt"
dictionary = dictionary_txt.split(/\n/)

p dictionary[55].gsub(/\r/, "")
