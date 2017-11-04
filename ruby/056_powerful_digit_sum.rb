# Project Euler Problem 56 Powerful digit sum
# A googol (10^100) is a massive number: one followed by one-hundred zeros;
# 100^100 is almost unimaginably large: one followed by two-hundred zeros.
# Despite their size, the sum of the digits in each number is only 1.

# Considering natural numbers of the form, ^b, where a, b < 100, what is the maximum digital sum?

# November 4, 2017
# Simple Ruby solution, calculating all of the exponents, type converting to strings,
# splitting those strings into arrays, converting each digit back into an integer,
# then summing each array, and keeping track of the largest sum. Ruby's native big number
# support makes this problem simple and carefree. Solves in 0.4s.

require 'benchmark'

def find
  max_sum = 0

  (1...100).each do |a|
    (1...100).each do |b|
      digit_sum = (a**b).to_s.split(//).map(&:to_i).sum 
      max_sum = digit_sum if digit_sum > max_sum
    end
  end

  puts max_sum
end

Benchmark.bm { |x| x.report { find }}

# user     system      total        real
# 972
# 0.400000   0.000000   0.400000 (  0.400626)
