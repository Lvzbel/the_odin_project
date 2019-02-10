puts rand
puts rand(5)

#rand return a number less than the number given
#For example:
#If we need a ramdon number between 1 - 100
#we use rand(101)
puts "The weatherman said there is a #{rand(101)}% chance of rain,"
puts "but we can never trust a weatherman."

# srand
# is like a seed of a random generated numbers that will always generate the same amount
srand 1776
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts ''
srand 1776
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
