# Project Euler Problem 347: Largest integer divisible by two primes
# November 18, 2017

# The largest integer ≤ 100 that is only divisible by both the
# primes 2 and 3 is 96, as 96=32*3=25*3. For two distinct primes
# p and q let M(p,q,N) be the largest positive integer ≤N only
# divisible by both p and q and M(p,q,N)=0 if such a positive
# integer does not exist.

# E.g. M(2,3,100)=96.
# M(3,5,100)=75 and not 90 because 90 is divisible by 2 ,3 and 5.
# Also M(2,73,100)=0 because there does not exist a positive
# integer ≤ 100 that is divisible by both 2 and 73.

# Let S(N) be the sum of all distinct M(p,q,N). S(100)=2262.

# Find S(10 000 000).

# Current solutions below... both take upwards of 8 minutes
# TODO: code which solves in under 60 seconds

require "prime"
require "benchmark"

Benchmark.bm do |x|
  x.report do

cache = {}
(1..10_000).each do |x|
  next if x.prime?
  d = x.prime_division
  next unless d.size == 2
  cache[[d[0][0],d[1][0]]] = x
end
p cache.values.sum
end
end


# user     system      total        real
# 11109800204052
# 565.820000   3.690000 569.510000 (580.863737)



sum = 0
Prime.each do |p|
  break if p > N / 2
  plimit = Math.log(N, p)
  Prime.each do |q|
    break if q > N / 2
    next unless p < q
    break if p * q > N
    qlimit = Math.log(N, q)
    holder = 0
    temp_diff = N
    1.upto(plimit + 1) do |pexp|
      1.upto(qlimit + 1) do |qexp|
        num = p**pexp * q**qexp
        break if num > N
        diff = N - num
        if diff < temp_diff
          temp_diff = diff
          holder = num
        end
      end
    end
    sum += holder
  end
end
p sum

end
end


# 10 000 000 
#        user     system      total        real
# 11109800204052
# 509.120000   1.780000 510.900000 (513.381797)