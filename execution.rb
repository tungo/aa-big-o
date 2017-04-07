def my_min(arr)
  arr.each.with_index do |el, idx1|
    min = true
    (idx1 + 1...arr.length).each do |idx2|
      min = false if el > arr[idx2]
    end

    return el if min
  end

  nil
end

def my_min2(arr)
  min = nil
  arr.each { |el| min = el if min == nil || min > el }
  min
end

def sub_sum(arr)
  
end

def sub_sum2(arr)
  max_so_far = nil
  max_ending_here = 0

  arr.each do |el|
    max_ending_here += el

    if max_so_far.nil? || max_so_far < max_ending_here
      max_so_far = max_ending_here
    end

    max_ending_here = 0 if max_ending_here < 0
  end

  max_so_far
end
