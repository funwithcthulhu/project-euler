# Project Euler #179
# Consecutive Positive Divisors
# Find the number of integers 1 < n < 10^7, for which n and n + 1 have the same
# number of positive divisors. For example, 14 has the positive divisors 1, 2, 7, 14
# while 15 has 1, 3, 5, 15.

# For this problem I iterate over i and k where i * k < the limit, and increment
# hash values mapped to i * k by one for each i * k. Then, I loop through the hash
# keys and count the number of consecutive keys with the same number of values.

# EDIT: hashes aren't made with the idea of accessing data in a particular order
# SO, I reimplemented the same algorithm using an array instead of a hash.
# The results are noticeable. Using an array is more than twice as fast.
#
# Using an array:
# user     system      total        real
#  986262
# 26.600000   0.090000  26.690000 ( 26.706519)
#
# Using a hash:
# user     system      total        real
# 986262
# 56.940000   0.430000  57.370000 ( 57.458415)

require 'benchmark'

# with a hash
def find(limit)
  cache = Hash.new(0)
  count = 0

  (1..limit).each do |i|
    (1..limit).each do |k|
      break if i * k > limit
      cache[i * k] += 1
    end
  end

  cache.keys.each do |v|
    if cache[v] == cache[v + 1]
      count += 1
    end
  end
  puts count
end

# with an array
def find_array(limit)
  cache = Array.new(limit + 1, 0)
  count = 0

  (1..limit).each do |i|
    (1..limit).each do |k|
      break if i * k > limit
      cache[i * k] += 1
    end
  end

  cache.each_index do |v|
    if cache[v] == cache[v + 1]
      count += 1
    end
  end
  puts count
end

Benchmark.bm do |x|
  x.report { puts find(10**7) }
  x.report { puts find_array(10**7) }
end
