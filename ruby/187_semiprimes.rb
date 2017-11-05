# Project Euler Problem 187: Semiprimes
# A composite is a number containing at least two prime factors.
# For example, 15 = 3 × 5; 9 = 3 × 3; 12 = 2 × 2 × 3.

# There are ten composites below thirty containing precisely two,
# not necessarily distinct, prime factors: 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.

# How many composite integers, n < 108, have precisely two, not necessarily
# distinct, prime factors?

# For this problem, I start with an array of primes. We only need primes up to n,
# where 2 * n > our limit. I iterate over this array twice, finding all numbers
# which can be made by multiplying any two primes. For each number k made by 
# prime a * prime b, I add an item to an array at index k, such that array[k] = 1.
# I'm not sure about other languages, but in Ruby if we add an item to an index in
# an array, and there are no items previous, then Ruby fills in "nil" for those
# earlier indexes. Thus, at the end of the program, I can use 'compact' to remove
# all 'nil's from the array, and the size of the array will be our answer.

# user     system      total        real
# 17427258
# 6.650000   0.780000   7.430000 (  7.467503)

require "prime"
require "benchmark"

def find(lim)
  primes = []
  Prime.each do |x|
    break if x > lim / 2
    primes << x
  end
  array = []
  primes.each do |a|
    primes.each do |b|
      break if a * b > lim
      array[a*b] = 1
    end
  end
  array.compact.size
end

Benchmark.bm { |x| x.report { puts find(10**8) }}
