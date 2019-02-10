#Let's write a program which asks us to type in as many words as we want 
#(one word per line, continuing until we just press Enter on an empty line),
#and which then repeats the words back to us in alphabetical order. OK? 

sorted_words = []

finished_indicator = false

while (finished_indicator == false)
  word = gets.chomp
  if word == ''
    finished_indicator = true
  else
    sorted_words.push word
  end
end

puts sorted_words.sort.join(',')
