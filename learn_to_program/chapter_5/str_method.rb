# String Methods
# .reverse
var1 = 'stop'
 puts var1.reverse
 puts var1

puts 'What is your full name?'
name = gets.chomp
puts "Did you know there are #{name.length} characters in your name, #{name}?"

letters = "aAbBcCdDeE"
puts "Original string"
puts letters
puts "str.upcase"
puts letters.upcase
puts "str.downcase"
puts letters.downcase
puts "str.swapcase"
puts letters.swapcase
puts "str.capitalize"
puts letters.capitalize
puts " a".capitalize

lineWidth = 50
puts(                'Old Mother Hubbard'.center(lineWidth))
puts(               'Sat in her cupboard'.center(lineWidth))
puts(         'Eating her curds an whey,'.center(lineWidth))
puts(          'When along came a spider'.center(lineWidth))
puts(         'Which sat down beside her'.center(lineWidth))
puts('And scared her poor shoe dog away.'.center(lineWidth))

lineWidth = 40
str = '--> text <--'
puts str.ljust  lineWidth
puts str.center lineWidth
puts str.rjust  lineWidth
puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)
