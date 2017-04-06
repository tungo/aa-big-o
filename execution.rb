def my_min arr
  min = nil
  arr.each.with_index do |el, i|
    (el...arr.length).each do |j|
      min = arr[j] if el < arr[j]
    end
  end
end

def my_min_II arr
  min = nil
  arr.each {|el| min = el if (min == nil || min > el)}
  min
end

def power_set arr
  arr.reduce([[]]) {|powerset, el|
    powerset + powerset.map{|set| [el] + set}
  }
end

def sub_sum arr
  power_set(arr).map do |set|
    set.reduce(0, &:+)
  end.max
end

def sub_sum2(arr)
  max_so_far = nil
  max_ending_here = 0

  arr.each_with_index do |el, i|
    max_ending_here += el
    p "max_ending_here == " + max_ending_here.to_s
    p "max_so_far == " + max_so_far.to_s

    if max_so_far.nil? || max_so_far < max_ending_here
      max_so_far = max_ending_here
    end
    max_ending_here = 0 if max_ending_here < 0
  end

  max_so_far
end
