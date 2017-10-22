require 'prime'
require 'benchmark'

def unitary_sum(num)
  factors = factors(num)
  sum = 1
  factors.each do |item|
    sum *= (1 + item)
    sum %= 1_000_000_009
  end
  sum
end

def factors(n)
  primes = []
  (2..n).each do |x|
    count = 0
    if x.prime?
      i = 1
      until x**i > n
        count += (n / x**i)
        i += 1
      end
      primes << (x**2)**count
    end
  end
  primes
end

Benchmark.bm do |x|
  x.report { puts unitary_sum(ARGV[0].to_i) }
end

