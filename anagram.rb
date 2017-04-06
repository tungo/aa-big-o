

def first_anagram_I str1, str2
  str1.chars.permutation.include?(str2)
end

def first_anagram_II str1, str2
  str1.each_char do |char|
    index = str2.index(char)
    str2[index] = '' if !index.nil?
  end
  str2.empty?
end

def first_anagram_III str1, str2
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  hash1 = (0...str1.length).reduce({}) do |object, i|
    object[str1[i]] ||= 0
    object[str1[i]] += 1
    object
  end
  hash2 = (0...str2.length).reduce({}) do |object, i|
    object[str2[i]] ||= 0
    object[str2[i]] += 1
    object
  end
  hash1 == hash2
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
