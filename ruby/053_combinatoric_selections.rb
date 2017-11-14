# Project Euler Problem 53 - Combinatoric Selections
# November 13, 2017

# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5C3 = 10.

# In general,

# nCr =	 n! / r!(n−r)!
# where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.

# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

# How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100,
# are greater than one-million?

# Solution using Ruby's #combination method.
# The size of the array produced from (1..n).to_a.combination(r)
# is equal to nCr

# We know no n's < 23 will yield an nCr > 1_000_000, and we know
# that r <= n. These small optimizations speed the program up x 10

# user     system      total        real
# 4075
# 0.030000   0.000000   0.030000 (  0.039579)

require 'benchmark'

Benchmark.bm do |x|
  x.report do
    values = 0

    23.upto(100) do |n|
      1.upto(n) do |r|
        values += 1 if (1..n).to_a.combination(r).size > 1_000_000
      end
    end
    puts values
  end
end
