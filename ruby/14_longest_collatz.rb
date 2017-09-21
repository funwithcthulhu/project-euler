# Project Euler Problem 14: Longest Collatz Sequence

# Recursive solution brute forces every collatz sequence,
# mapping the input with the length into a hash, then returning
# the n corresponding to the largest sequence

require 'benchmark'

def find_collatz(n)
  hash = {}
  1.upto(n).each do |number|
    hash[collatz(number)] = number
  end
  highest = hash.keys.max
  puts hash[highest]
end


def collatz(n, arr = [])
  arr ||= []
  arr << n
  collatz(n / 2, arr) if n.even? && n != 1
  collatz(3 * n + 1, arr) if n.odd? && n != 1
  arr.size
end

Benchmark.bm do |x|
  x.report("1_000_000: ") { puts find_collatz(1_000_000) }
end

#        user     system      total        real
# 1_000_000: 837799
#      21.170000   0.150000  21.320000 ( 21.439941)