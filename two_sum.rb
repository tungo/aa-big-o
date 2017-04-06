def two_sum? arr, num
  sorted_arr = arr.sort
  l = 0
  r = arr.length - 1
  while(sorted_arr[l] + sorted_arr[r] != num)
    if(sorted_arr[l] + sorted_arr[r] > num)
      r -= 1
    else
      l += 1
    end
    return false if(l == r)
  end
  return true
end

def bad_two_sum? arr, num
  (0..arr.length - 2).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == num
    end
  end
  return false
end

def two_sum_indices arr, target_sum
  complements = {}
  arr.each.with_index {|el, i|
    if(complements[target_sum - el])
      return [i, complements[target_sum - el].first]
    end
    complements[el] ||= []
    complements[el] << i
  }
  return nil
end
