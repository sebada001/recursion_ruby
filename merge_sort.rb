# frozen_string_literal: true

def merge_sort(arr)
  return arr if arr.length < 2

  left_d, right_d = arr.each_slice((arr.size / 2.0).round).to_a
  left = merge_sort(left_d)
  right = merge_sort(right_d)
  center = []
  ind1 = 0
  ind2 = 0
  while ind1 < left.length && ind2 < right.length
    if left[ind1] <= right[ind2]
      center.push(left[(ind1)])
      ind1 += 1
    else
      center.push(right[(ind2)])
      ind2 += 1
    end
    # optimizing
    if ind1 == left.length
      center += right.slice(ind2..-1)
    elsif ind2 == right.length
      center += left.slice(ind1..-1)
    end
  end
  center
end

p merge_sort([1, 3, 5, 2])
