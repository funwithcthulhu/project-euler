require "benchmark"

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

PRIMES = (10..740_000).select { |x| isPrime(x) }

def right_trunc?(prime)
  switch = true
  until prime.to_s.size == 1
    switch = false unless isPrime(prime)
    prime = prime.to_s.split(//)
    prime.pop
    prime = prime.join.to_i
  end
  switch = false unless isPrime(prime)
  switch
end

def left_trunc?(prime)
  switch = true
  until prime.to_s.size == 1
    switch = false unless isPrime(prime)
    prime = prime.to_s.split(//)
    prime.shift
    prime = prime.join.to_i
  end
  switch = false unless isPrime(prime)
  switch
end

def truncatable?(prime)
  return false if prime < 8
  return false if !right_trunc?(prime)
  return false if !left_trunc?(prime)
  return true
end

def find
  truncs = [] of Int32
  #(10..Float32::INFINITY).each do |candidate|
  PRIMES.each do |candidate|
    truncs << candidate if truncatable?(candidate)
    break if truncs.size == 11
  end
  truncs.sum
end

Benchmark.bm do |x|
  x.report("sum: ") { puts find }
end

# Using (10..Float32::INFINITY).each
# user     system      total        real
# sum:  748317
# 2.620000   0.730000   3.350000 (  2.811364)
#
# Using PRIMES.each
# user     system      total        real
# sum:  748317
# 0.190000   0.020000   0.210000 (  0.195004)