def fibs(num)
  num -= 1
  result = [0, 1]
  num.times do 
    result << result[-2] + result[-1]
  end
  result
end

p fibs(14)