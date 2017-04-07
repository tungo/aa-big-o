def first_anagram?(str1, str2)
  str1.chars.permutation.include?(str2)
end

def second_anagram?(str1, str2)
  str1.each_char do |char|
    index = str2.index(char)
    str2[index] = '' unless index.nil?
  end

  str2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  str1.chars.each do |char|
    hash1[char] += 1
  end

  hash2 = Hash.new(0)
  str2.chars.each do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end
