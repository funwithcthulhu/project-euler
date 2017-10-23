require 'prime'
require 'benchmark'
require 'openssl'

def unitary_sum(num)
  sum = 1
  factors(num).each do |item|
    sum *= (1 + item)
    sum %= 1_000_000_009
  end
  sum
end

def factors(n)
  primes = []
  Prime.each do |x|
    break if x > n
    count = 0
    i = 1
    until x**i > n
      count += (n / x**i)
      i += 1
    end
    primes << (x * x).to_bn.mod_exp(count, 1_000_000_009)
  end
  primes
end

Benchmark.bm do |x|
  x.report { puts unitary_sum(ARGV[0].to_i) }
end

#        user     system      total        real
# 98792821
# 41.150000   0.870000  42.020000 ( 42.207820)

