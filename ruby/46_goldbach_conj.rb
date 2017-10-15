"""
Goldbach's other conjecture
Problem 46
It was proposed by Christian Goldbach that every odd composite
number can be written as the sum of a prime and twice a square.

9 = 7 + 2×12
15 = 7 + 2×22
21 = 3 + 2×32
25 = 7 + 2×32
27 = 19 + 2×22
33 = 31 + 2×12

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written
as the sum of a prime and twice a square?

"""

require 'prime'
require 'benchmark'

SOURCE = (2..10_000).select do |x|
  !x.prime? && x.odd?
end

def goldbach?(num)
  goldbach = false
  Prime.each do |p|
    (1..Math.sqrt(num)).each do |sqr|
      goldbach = true if p + (2 * sqr**2) == num
      break if goldbach
    end
    break if goldbach
    break if p > num
  end
  goldbach
end

def find
  SOURCE.reject do |candidate|
    goldbach?(candidate)
  end.sort.first
end

Benchmark.bm do |x|
  x.report do
    puts find
  end
end

# user     system      total        real
# 5777
# 4.950000   0.020000   4.970000 (  5.018888)
