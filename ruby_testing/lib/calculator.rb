class Calculator

  def add(*nums)
    result = 0
    nums.each do |num|
      result += num
    end
    result
  end

  def subtract(*nums)
    result = nums[0]
    nums[1..-1].each do |num|
      result -= num
    end
    result
  end

end