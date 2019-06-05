class Calculator

  def add(*nums)
    result = 0
    nums.each do |num|
      result += num
    end
    result
  end
  
end