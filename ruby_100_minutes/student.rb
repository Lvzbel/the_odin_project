class Student
  attr_accessor :first_name, :last_name, :primary_phone_number

  def introduction(target)
    puts "Hi #{target}, I'm #{first_name}!"
  end

  def favorite_number
    7
  end
end

rodrigo = Student.new
rodrigo.first_name = "Rodrigo"
rodrigo.introduction('Katrina')
puts "Rodrigo's favorite number is #{rodrigo.favorite_number}."
