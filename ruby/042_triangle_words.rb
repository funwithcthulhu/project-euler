"""
Coded triangle numbers
Problem 42 
The nth term of the sequence of triangle numbers is given by:

tn = ½n(n+1)

so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding
to its alphabetical position and adding these values we form a
word value.

For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.

If the word value is a triangle number then we shall call the
word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'),
a 16K text file containing nearly two-thousand common English words,
how many are triangle words?

---------------------------------------------------------

Straight forward Ruby... I turn the file into an array of words,
then turn each word into a sum of it's letter values, which I
derive by using module 64 on the letter's ASCII code. If the sum
is a triangle number, then I iterate my word counter by 1 (yes,
that's a global variable, I DO WHAT I WANT!).

My triangle number checker is derived by solving the triangle
number formula for n, then plugging that into the formula in order
to find an equation for triangle numbers that doesn't require n.
Then, I check the number in question, i, against my formula t(i).
If they are equal, the number is triangular.

Finds solution in 11.75 ms
"""
require 'benchmark'

word_arr = File.open('p042_words.txt').readlines.join.split('"').delete_if { |x| x == ","}.sort!

$word_count = 0

def parse_word(word)
  unless word.empty?
    a = ->(t) { Math.sqrt((t * 2) - 1).floor }
    tn = ->(t) { a[t] * (a[t] + 1) / 2 }
    is_triangle = ->(t) { tn[t] == t }
    sum = 0
    word.split(//).each do |letter|
      sum += letter.ord % 64
    end
    $word_count += 1 if is_triangle[sum]
  end
end

Benchmark.bm do |x|
  x.report do
    word_arr.each do |word|
      parse_word(word)
    end
    puts $word_count
  end
end

# Finds solution in 11.75 ms
# user     system      total        real
# 162
# 0.010000   0.000000   0.010000 (  0.011750)
