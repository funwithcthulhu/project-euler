# Project Euler Problem 357
# Consider the divisors of 30: 1,2,3,5,6,10,15,30.
# It can be seen that for every divisor d of 30, d+30/d is prime.
#
# Find the sum of all positive integers n not exceeding 100 000 000
# such that for every divisor d of n, d+n/d is prime.
#


require "benchmark"

def isPrime(n : Int64)
  if n == 1_i64
    false
  elsif n < 4_i64
    true
  elsif (n % 2_i64).zero?
    false
  elsif n < 9_i64
    true
  elsif (n % 3_i64).zero?
    false
  else
    r = Math.sqrt(n).floor
    f = 5_i64
    while f <= r
      return false if (n % f).zero?
      return false if (n % (f + 2_i64)).zero?
      f += 6_i64
    end
  true
  end
end


def divisors(num : Int64)
  (1_i64..Math.sqrt(num)).select do |val|
    (num % val).zero?
  end.reduce([] of Int64) do |arr, i|
    arr << i
    arr << num / i unless i == num / i
    arr
  end.sort
end

def generator?(num : Int64)
  divisors(num).each do |div|
    return false unless isPrime(div + num/div)
  end
  true
end


def sum(lim : Int64)
  primes = [] of Int64
  (1_i64..lim).step(2_i64) do |x|
    break if x > lim
    primes << (x - 1_i64) if isPrime((x - 1_i64)/2_i64 + 2_i64) && generator?(x - 1_i64)
  end
  primes.sum + 1
end

Benchmark.bm do |x|
  x.report("#{ARGV[0]}: ") { puts sum(ARGV[0].to_i64) }
end

# user     system      total        real
# 1000:  8427
#  0.000000   0.000000   0.000000 (  0.000740)
# 10000:  262615
#  0.000000   0.000000   0.000000 (  0.002743)
# 100000:  9157937
#  0.020000   0.000000   0.020000 (  0.023899)
# 1000000:  524402305
#  0.420000   0.000000   0.420000 (  0.427435)
# 10000000:  27814470277
#  10.250000   0.010000   10.260000 (  10.273292)
# 100000000:  1739023853137
#  275.460000   0.810000   276.270000 (  278.918402)