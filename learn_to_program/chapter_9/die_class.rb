class Die
  def initialize
    #I'll just roll the die, though we
    #could do something else if we wanted
    #to, like setting the die with 6 showing
    roll
  end

  def roll
    @numberShowing = 1 + rand(6) 
  end

  def showing
    @numberShowing
  end

  def cheat num
    if (num >= 1 && num <= 6)
      @numberShowing = num 
    end
  end
end

puts Die.new.showing

puts "Cheating"
cheating = Die.new
cheating.cheat 5
puts cheating.showing
puts

die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing
