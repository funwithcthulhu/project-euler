# Project Euler Problem 87 Prime Power Triples
# Nov 7, 2017
#The smallest number expressible as the sum of a prime square, prime cube,
# and prime fourth power is 28. In fact, there are exactly four numbers below
# fifty that can be expressed in such a way:

# 28 = 2^2 + 2^3 + 2^4
# 33 = 3^2 + 2^3 + 2^4
# 49 = 5^2 + 2^3 + 2^4
# 47 = 2^2 + 3^3 + 2^4

# How many numbers below fifty million can be expressed as the sum of a prime square,
# prime cube, and prime fourth power?

# For this problem, I use nested loops of Prime numbers to generate all the sums of
# a**2 + b**3 + c**4 below the limit. Initially, I added them to an array. At the end of the program,
# I removed empty indexes from the array and returned the size of the array. However, I switched
# to a simple counter, using a hash table to keep track of duplicate values. This code can be found
# at the bottom, and runs a little bit faster. It also seems a more appropriate use of data structures.

# user     system      total        real
# 1097343
# 2.850000   0.300000   3.150000 (  3.164138)

require 'benchmark'
require 'prime'

# Nested loops are used to iterate over 3 prime numbers
# All sums of a**2 + b**3 + c**4 are added to an array at their corresponding index
# This ensures that duplicate numbers aren't counted
# Indexes without a number == nil, and are removed at the end of the program
def search(lim)
  count = []
  Prime.each do |a|
    # Because we are exponentiating each prime,
    # we can break the loop much lower than the limit
    break if a > Math.sqrt(lim)
    Prime.each do |b|
      break if b > Math.sqrt(lim)
      Prime.each do |c|
        break if c > Math.sqrt(lim)
        t = a**2 + b**3 + c**4
        break if t > lim
        count[t] = t
      end
    end
  end
  count.compact.size
end

Benchmark.bm { |x| x.report { puts search(50_000_000) }}

# The below version of the code uses a hash table to check if we have encountered
# a sum before, to avoid counting duplicates. Runs a bit faster.

# user     system      total        real
# 1097343
# 2.800000   0.020000   2.820000 (  2.842315)

def search(lim)
  count = 0
  cache = {}
  Prime.each do |a|
    # Because we are exponentiating each prime,
    # we can break the loop much lower than the limit
    break if a > Math.sqrt(lim)
    Prime.each do |b|
      break if b > Math.sqrt(lim)
      Prime.each do |c|
        break if c > Math.sqrt(lim)
        t = a**2 + b**3 + c**4
        break if t > lim
        next if cache.key?(t)          
        count += 1
        cache[t] = t
      end
    end
  end
  count
end

Benchmark.bm { |x| x.report { puts search(50_000_000) }}

require 'set'

# Note: Testing out using a set here instead of a hash lookup/array... runs a little
# slower than the hash look up above.

#        user     system      total        real
# 1097343
# 2.790000   0.060000   2.850000 (  2.853030)
def search(lim)
  count = Set.new
  Prime.each do |a|
    # Because we are exponentiating each prime,
    # we can break the loop much lower than the limit
    break if a > Math.sqrt(lim)
    Prime.each do |b|
      break if b > Math.sqrt(lim)
      Prime.each do |c|
        break if c > Math.sqrt(lim)
        t = a**2 + b**3 + c**4
        break if t > lim
        count.add(t)
      end
    end
  end
  count.size
end

Benchmark.bm { |x| x.report { puts search(50_000_000) }}