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


require 'benchmark'
require 'prime'

# Brute force algorithm to find totient of any number
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

# Totient function based on Euler's product formula
def totient(n)
  running_tot = n
  divisors = []
  factor_array = Prime.prime_division(n)
  factor_array.each do |array|
    divisors.push(array.first)
  end
  divisors.each do |factor|
    running_tot *= (1.0 - (1.0/factor.to_f))
  end
  running_tot
end

# Finds the n with the maximum n / totient(n) within 1..lim, inclusive
def totient_max(lim)
  tot_max = 0
  n = 0
  (3..lim).each do |i|
    if i.to_f / totient(i) >= tot_max
      tot_max = i.to_f / totient(i)
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
    temp = Prime.prime_division(i).size
    if temp > count
      count = temp
      n = i
    end
  end
  puts n
end

# multiplies primes until they exceed target
def mult_primes(limit)
  total = 1
  Prime.each do |prime|
    break if (total * prime > limit)
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
  x.report("totmax(1_000_000): ") { puts mult_primes(1_000_000) }
end

#
#
# Using prime_factors f(x) and totient f(x) based on Euler's product formula
# user     system      total        real
# 100: 90
#  0.000000   0.000000   0.000000 (  0.000459)
# 1_000: 840
#  0.000000   0.000000   0.000000 (  0.004438)
# 10_000: 9240
#  0.050000   0.000000   0.050000 (  0.050886)
# 100_000: 90090
#  0.890000   0.010000   0.900000 (  0.902277)
# 1_000_000: 510510
# 19.160000   0.080000  19.240000 ( 19.380333)
# gprimes(1_000_000): 510510
# 18.430000   0.070000  18.500000 ( 18.616167)
# totmax(1_000_000): 510510
# 0.000000   0.000000   0.000000 (  0.000039)
#
# NOTE: do to being an idiot and using ints instead of floats to
# determine n/φ(n) for hours, the following benchmarks
# all have the wrong answers, and are included below only to 
# demonstrate speed of various algorithms
# Using totient function based on Euler's product forumla (wikipedia)
#        user     system      total        real
# 100: 6
# 0.000000   0.000000   0.000000 (  0.000693)
# 1_000: 210
# 0.000000   0.000000   0.000000 (  0.005467)
# 10_000: 210
# 0.080000   0.000000   0.080000 (  0.082081)
# 100_000: 30030
# 1.270000   0.010000   1.280000 (  1.310714)
# 1_000_000: 30030
# 29.350000   0.140000  29.490000 ( 31.224167)

# with .select in the totient function
# user     system      total        real
# 100: 6
#  0.000000   0.000000   0.000000 (  0.001178)
# 1_000: 210
#  0.110000   0.000000   0.110000 (  0.110565)
# 10_000: 210
# 11.570000   0.170000  11.740000 ( 12.210607)

# with .each in the totient function
#        user     system      total        real
# 100: 6
# 0.010000   0.000000   0.010000 (  0.000874)
# 1_000: 210
# 0.090000   0.000000   0.090000 (  0.099582)
# 10_000: 210
# 10.490000   0.090000  10.580000 ( 10.912877)

# with .even? in totient function
# user     system      total        real
# 100: 6
# 0.000000   0.000000   0.000000 (  0.000666)
# 1_000: 210
# 0.080000   0.000000   0.080000 (  0.078038)
# 10_000: 210
# 8.030000   0.060000   8.090000 (  8.362861)