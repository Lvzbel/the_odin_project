# Using iteration
def fibs(num)
  num -= 1
  result = [0, 1]
  num.times do 
    result << result[-2] + result[-1]
  end
  result
end

# Using recursion
def fibs_rec(ary, num)
  return ary if num <= 0
  ary.length == 0 ? ary = [0, 1] : ary << ary[-2] + ary[-1]
  fibs_rec(ary, num -1)
end

p fibs(14)
p fibs_rec([], 14)