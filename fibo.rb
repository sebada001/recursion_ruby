def fibs(number)
  return [0] if number == 1
  return [0, 1] if number == 2
  arr = [0, 1]
  (number-2).times do |i|
    arr.push( arr[i] + arr[i+1] )
  end
  arr
end

def fibs_rec(number, arr = [0, 1])
  number > 2 ? fibs_rec(number -= 1, (arr << (arr[-1] + arr[-2]))) : arr
end

p fibs_rec(8)
