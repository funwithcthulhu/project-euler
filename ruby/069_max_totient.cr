# Project Euler # 69 - Totient Maximum

# At first I attempted a brute force solution, using a
# brute force method to determine the totient of a
# given number (i.e. iterating over 1..number, and keeping a
# tally of the nums for which gcd == 1). This program was
# taking upwards of 300 seconds for n = 100_000 in Crystal
# even after I optimized the code a little bit (i.e. only skip
# even numbers when iterating for totient of an even number, etc).

# So, next I did some background reading on wikipedia, and
# implemented Euler's Product formula. This significantly sped
# things up, but I still wasn't getting the right answer and couldn't
# figure out why. Well, I was treating n/φ(n) as an integer and it
# was getting truncated! So, my program considered 30030 the right
# answer bc it's n/φ(n) == 5 after being truncated, and none of the
# following numbers have an n/φ(n) > 5 after their n/φ(n) has been
# rounded.

# Anyway, once I figured that out, I got the right answer
# immediately. Program runs in 4.5 seconds in Crystal and ~19 
# seconds in Ruby. After getting on here and reading a couple
# posts, I started kicking myself because I should have realized we
# are really searching for the number with the most prime factors. I
#  was looking right at Euler's Product formula! An implementation
# of that algorithm solves the problem in 0.000002 seconds in
# Crystal (considering it's just multiplying 7 numbers it's basically
# instantaneous). 

require "benchmark"

# def totient(n)
#  (1...n).select do |i|
#    n.gcd(i) == 1
#  end.size
# end

# Brute force function for finding the totient of a number
#
# def totient(n)
#   count = 0
#   if n.even?
#     (1...n).step(2).each do |i|
#       count += 1 if n.gcd(i) == 1
#     end
#   else
#     (1...n).each do |i|
#       count += 1 if n.gcd(i) == 1
#     end
#   end
#   count
# end

def prime_factors(n)
  arr = [] of Int32
  while (n % 2).zero?
    arr << 2
    n = n / 2
  end
  (3..(Math.sqrt(n) + 1).to_i).step(2).each do |i|
    while (n % i).zero?
      arr << i
      n = n / i
    end
  end
  arr << n if n > 2
  arr.uniq
end

# Totient function based on Euler's product formula
def totient(n, divisors)
  running_tot = n
  divisors.each do |factor|
    running_tot *= (1.0 - (1.0/factor.to_f))
  end
  running_tot
end

def totient_max(lim)
  current_max = 0
  n = 0
  (3..lim).each do |i|
    temp = totient(i, prime_factors(i))
    if i.to_f / temp >= current_max
      current_max = i / temp
      n = i
    end
  end
  n
end

# brute force check n in 1..p for greatest # of prime factors
# not really any faster than above methods...
def gprimes(p)
  n = 0
  count = 0
  (1..p).each do |i|
    temp = prime_factors(i).size
    if temp > count
      count = temp
      n = i
    end
  end
  puts n
end

def isPrime(n)
  if n == 1
    false
  elsif n < 4
    true
  elsif (n % 2).zero?
    false
  elsif n < 9
    true
  elsif (n % 3).zero?
    false
  else
    r = Math.sqrt(n).floor
    f = 5
    while f <= r
      return false if (n % f).zero?
      return false if (n % (f + 2)).zero?
      f += 6
    end
  true
  end
end

PRIMES = (1..100).select { |i| i if isPrime(i) }

def tot_max(limit)
  total = 1
  PRIMES.each do |prime|
    break if total * prime > limit
    total *= prime
  end
  total
end

Benchmark.bm do |x|
  x.report("100: ") { puts totient_max(100) }
  x.report("1_000: ") { puts totient_max(1_000) }
  x.report("10_000: ") { puts totient_max(10_000) }
  x.report("100_000: ") { puts totient_max(100_000) }
  x.report("1_000_000: ") { puts totient_max(1_000_000) }
  x.report("gprimes(1_000_000): ") { puts gprimes(1_000_000) }
  x.report("tot_max(1_000_000): ") { puts tot_max(1_000_000) }
end

# Using prime_factors f(x) and totient f(x) based on Euler's product formula
# user     system      total        real
# 100:                 90
#  0.000000   0.000000   0.000000 (  0.000536)
# 1_000:               840
#  0.000000   0.000000   0.000000 (  0.000876)
# 10_000:              9240
#  0.010000   0.000000   0.010000 (  0.009169)
# 100_000:             90090
#  0.160000   0.030000   0.190000 (  0.175155)
# 1_000_000:           510510
#  4.340000   0.300000   4.640000 (  4.502080)
# gprimes(1_000_000):  510510
#  4.330000   0.290000   4.620000 (  4.492273)
# tot_max(1_000_000):  510510
# 0.000000   0.000000   0.000000 (  0.000002)

# NOTE: do to being an idiot and using ints instead of floats to
# determine n/φ(n) for hours, the following benchmarks
# all have the wrong answers, and are included below only to 
# demonstrate speed of various algorithms
#
# user     system      total        real
# 100:        6
# 0.000000   0.000000   0.000000 (  0.001296)
# 1_000:      210
# 0.030000   0.000000   0.030000 (  0.029856)
# 10_000:     210
# 3.500000   0.130000   3.630000 (  3.553151)
# 100_000:    30030
# 427.040000   9.650000   436.690000 (  433.426913)

# with .each and .even in totient fx
# user     system      total        real
# 100:        6
# 0.000000   0.000000   0.000000 (  0.000621)
# 1_000:      210
# 0.020000   0.000000   0.020000 (  0.021971)
# 10_000:     210
# 2.660000   0.020000   2.680000 (  2.726509)
# 100_000:    30030
# 323.150000   1.540000   324.690000 (  332.285547)
