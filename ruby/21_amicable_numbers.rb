# Project Euler Problem 21 - Amicable Numbers
require 'benchmark'

def divisors(number)
  (1..Math.sqrt(number)).select do |val|
    (number % val).zero?
  end.inject([]) do |arr, i|
    arr << i
    arr << number / i unless i == number / i
    arr
  end.sort.delete_if { |x| x == number }
end

def amicable?(number)
  possible = divisors(number).inject(:+)
  divisors(possible).inject(:+) == number && possible != number
end

def amicable_sum(limit)
  (2...limit).select do |number|
    amicable?(number)
  end.inject(:+)
end

Benchmark.bm do |x|
  x.report('10_000: ') { puts amicable_sum(10_000) }
end

#       user     system      total        real
# 10_000: 31626
#    0.290000   0.000000   0.290000 (  0.286559)