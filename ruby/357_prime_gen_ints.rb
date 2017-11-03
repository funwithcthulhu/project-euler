# Project Euler Problem 357
# Consider the divisors of 30: 1,2,3,5,6,10,15,30.
# It can be seen that for every divisor d of 30, d+30/d is prime.
#
# Find the sum of all positive integers n not exceeding 100 000 000
# such that for every divisor d of n, d+n/d is prime.
#
# user     system      total        real
# 1739023853137
# 618.040000   3.200000 621.240000 (627.247723)

require "prime"
require "benchmark"

class Integer
  def divisors
    (1..Math.sqrt(self)).select do |val|
      (self % val).zero?
    end.inject([]) do |arr, i|
      arr << i
      arr << self / i unless i == self / i
      arr
    end.sort
  end

  def generator?
    self.divisors.each do |div|
      return false unless (div + self/div).prime?
    end
    true
  end
end

def sum(lim)
  primes = []
  Prime.each do |x|
    break if x > lim
    primes << (x - 1) if ((x - 1)/2 + 2).prime? && (x - 1).generator?
  end
  primes.sum
end

Benchmark.bm { |x| x.report { puts sum(ARGV[0].to_i) }}
