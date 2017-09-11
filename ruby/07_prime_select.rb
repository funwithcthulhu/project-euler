require 'benchmark'

def isPrime(num)
  return false if num < 2
  (2...num).to_a.select{ |x| num % x == 0 }.compact.empty?
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
  x.report('101: ') { nth_prime(101) }
end
