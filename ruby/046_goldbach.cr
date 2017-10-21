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

SOURCE = (2..10_000).select do |x|
  !isPrime(x) && x.odd?
end

PRIMES = (1..10_000).select do |p|
  isPrime(p)
end

def goldbach?(num)
  goldbach = false
  PRIMES.each do |p|
    (1..Math.sqrt(num)).each do |sqr|
      goldbach = true if p + (2 * sqr**2) == num
      break if goldbach
    end
    break if goldbach
    break if p > num
  end
  goldbach
end

def find
  SOURCE.reject do |candidate|
    goldbach?(candidate)
  end.sort.first
end

Benchmark.bm do |x|
  x.report do
    puts find
  end
end

# user     system      total        real
# 5777
# 0.030000   0.000000   0.030000 (  0.037563)