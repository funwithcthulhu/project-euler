# Anagramic Squares: Project Euler Problem 98
# By replacing each of the letters in the word CARE
# with 1, 2, 9, and 6 respectively, we form a square number:
# 1296 = 362. What is remarkable is that, by using the same
# digital substitutions, the anagram, RACE, also forms a square
# number: 9216 = 962. We shall call CARE (and RACE) a square anagram
# word pair and specify further that leading zeroes are not permitted,
# neither may a different letter have the same digital value as another letter.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text
# file containing nearly two-thousand common English words, find all the
# square anagram word pairs (a palindromic word is NOT considered to be an
# anagram of itself).

# What is the largest square number formed by any member of such a pair?

# NOTE: All anagrams formed must be contained in the given text file.

def square?(x)
  Math.sqrt(x) % 1 == 0
end

raw = File.open('p098_words.txt').readlines.join.split(/"/).delete_if { |x| x== "," }

anagrams = []

raw.each do |x|
  anagrams.push([x, raw.select { |y| y.split(//).sort == x.split(//).sort && y != x }])
end

anagrams.delete_if { |x| x[1].empty? }
anagrams.map! { |x| x.flatten }

squares = []

anagrams.each do |arr|
  first = arr[0]
  second = arr[1]
  uniq_letters = first.split(//).uniq.join('')
  (1..9).to_a.permutation(uniq_letters.size).each do |poss|
    f_n = first.tr(uniq_letters, poss.join('')).to_i
    s_n = second.tr(uniq_letters, poss.join('')).to_i
    squares.push([f_n, s_n]) if square?(f_n) && square?(s_n)
  end
end

puts squares.flatten.sort.reverse.first
# => 18769
