# Project Euler 429 Sum of Squares of Unitary Divisors

# A unitary divisor d of a number n is a divisor of n that has the property
# gcd(d, n/d) = 1.
# The unitary divisors of 4! = 24 are 1, 3, 8 and 24.
# The sum of their squares is 1^2 + 3^2 + 8^2 + 24^2 = 650.

# Let S(n) represent the sum of the squares of the unitary divisors of n. Thus S(4!)=650.

# Find S(100 000 000!) modulo 1 000 000 009.

# I use the unitary divisor function from this page
# (http://mathworld.wolfram.com/UnitaryDivisorFunction.html), and wrote a function for
# finding the prime factors of n! based on this page
# (https://janmr.com/blog/2010/10/prime-factors-of-factorial-numbers/).
# I was tripped up for a bit with massive unworkable numbers before I realized I could
# incrementally %= 1_000_000_009 the growing total, and use modular exponentiation.

# A Crystal version of this program initially produced the correct answer in ~170 seconds.
# After some optimizing I got the Ruby code down to ~42 seconds. I think the biggest time
# sink is the prime factors method I wrote, and it could probably be optimized, but 42
# seconds is plenty enough below a minute for me.


require 'prime'
require 'benchmark'
require 'openssl'

def unitary_sum(num)
  sum = 1
  factors(num).each do |item|
    sum *= (1 + item)
    sum %= 1_000_000_009
  end
  sum
end

def factors(n)
  primes = []
  Prime.each do |x|
    break if x > n
    count = 0
    i = 1
    until x**i > n
      count += (n / x**i)
      i += 1
    end
    primes << (x * x).to_bn.mod_exp(count, 1_000_000_009)
  end
  primes
end

Benchmark.bm do |x|
  x.report { puts unitary_sum(ARGV[0].to_i) }
end

#        user     system      total        real
# 98792821
# 41.150000   0.870000  42.020000 ( 42.207820)

