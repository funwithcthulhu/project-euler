require 'prime'
require 'benchmark'

def power(n, exponent)
  prod = 1
  while exponent > 0
    prod *= n if (exponent & 1) != 0
    n *= n
    exponent >>= 1
  end
  prod
end

def unitary_sum(num)
  #factors = Prime.prime_division(num) .. finds for num
  factors = factors(num) # finds for num!
  sum = 1
  factors.each do |sub_array|
    #sum *= (1 + (sub_array[0]**2)**sub_array[1])
    sum *= (1 + sub_array)
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
      #primes << [x, count]
      #primes << (x**2)**count
      primes << power((x**2),count)
    end
  end
  primes
end

Benchmark.bm do |x|
  x.report { puts unitary_sum(100) }
  x.report { puts unitary_sum(1_000) }
  x.report { puts unitary_sum(10_000) }
  x.report { puts unitary_sum(100_000) }
  #x.report { puts unitary_sum(1_000_000) }
end

