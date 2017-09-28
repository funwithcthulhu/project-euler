# Project Euler Problem 20 - Find the sum of the digits of 100!
#
# Recursive approach to finding the factorial. For the digit_sum
# lambda, I use type conversion to split the number into an array
# of digits, then sum the array.
# O(n) ??

def factorial(n, sum = 1)
  return sum if n < 2
  sum *= n
  factorial(n - 1, sum) unless n < 2
end

digit_sum = ->(digits) { digits.to_s.split(//).map(&:to_i).inject(:+) }

# irb(main):183:0> digit_sum(factorial(10))
# => 27

# irb(main):192:0> digit_sum[factorial(100)]
# => 648