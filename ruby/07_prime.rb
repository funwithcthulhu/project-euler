require 'benchmark'

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

def nth_prime(limit)
  count = 1
  candidate = 1
  while count < limit
    candidate += 2
    if isPrime(candidate)
      count += 1
    end
  end
  puts candidate
end

Benchmark.bm do |x|
  x.report('10001: ') { nth_prime(10001) }
  x.report('1000000: ') { nth_prime(1000000) }
end
