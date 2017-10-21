# We shall say that an n-digit number is pandigital
# if it makes use of all the digits 1 to n exactly
# once. For example, 2143 is a 4-digit pandigital and
# is also prime.
#
#
# What is the largest n-digit pandigital prime that exists?
#
# Solutions in Ruby and Crystal. Based on the instructions,
# I assumed the answer would have more than 4 digits, and
# knew that the answer couldn't have more than 9 digits.
# So, I created an array with each digit 1-9, then check
# every permutation for primality, before taking the 9 out,
# and checking each perm of 1-8 for primality, and so on until
# I get to 1-4. To speed things up, the program could stop
# checking permutations below n digits once a prime is found
# with n digits. However, as it is now Crystal takes 0.20
# seconds to find a solution,  and Ruby only 1.69 seconds,
# and I think that's plenty fast enough. I reuse the isPrime
# function I learned from Project Euler to find prime-ness
# with Crystal.

require 'benchmark'
require 'prime'

def pandigital
  source = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  primes = []
  while source.size > 4
    temp = source.permutation(source.size).to_a.map { |x| x.join.to_i }
    primes << temp.select { |c| c.prime? }
    break if !primes.flatten.empty?
    source.pop
  end
  primes.flatten.sort.last
end

Benchmark.bm { |x| x.report { puts pandigital }}

#  user     system      total        real
#  7652413
#  1.630000   0.030000   1.660000 (  1.671086)