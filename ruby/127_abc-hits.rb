# Project Euler Problem 127
# The radical of n, rad(n), is the product of distinct prime factors of n.
# For example, 504 = 23 × 32 × 7, so rad(504) = 2 × 3 × 7 = 42.

# We shall define the triplet of positive integers (a, b, c) to be an abc-hit if:

# GCD(a, b) = GCD(a, c) = GCD(b, c) = 1
# a < b
# a + b = c
# rad(abc) < c
# For example, (5, 27, 32) is an abc-hit, because:

# GCD(5, 27) = GCD(5, 32) = GCD(27, 32) = 1
# 5 < 27
# 5 + 27 = 32
# rad(4320) = 30 < 32
# It turns out that abc-hits are quite rare and there are only thirty-one abc-hits
# for c < 1000, with ∑c = 12523.

# Find ∑c for c < 120000.

require 'prime'
require 'benchmark'

def radical(n)
  product = 1
  Prime.prime_division(n).each do |x|
    product *= x[0]
  end
  product
end

def find(lim)
  hits = []
  rads = (1..lim).map { |x| radical(x) }
  rads.unshift(0)
  rads.each_index do |a|
    next if a.zero?
    rads.each_index do |b|
      break if (a + b) >= lim
      next unless rads[b] > rads[a]
      next unless a.gcd(b) == 1
      next unless (rads[a] * rads[b]  * rads[a + b]) < a + b
      hits << a + b
    end
  end
  hits
end

def sum(lim)
  hits = find(lim)
  puts hits.reduce(:+)
end

Benchmark.bm do |x|
  x.report("#{ARGV[0]}: ") { sum(ARGV[0].to_i) }
end

######
# user     system      total        real
# 18407904
# 1391.720000   5.670000 1397.390000 (1536.916336)
