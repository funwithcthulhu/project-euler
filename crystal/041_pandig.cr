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

def pandigital
  source = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  primes = [] of Array(Int32)
  while source.size > 4
    temp = source.permutations(source.size).to_a.map { |x| x.join.to_i }
    primes << temp.select { |c| isPrime(c) }
    break if !primes.flatten.empty?
    source.pop
  end
  primes.flatten.sort.last
end

Benchmark.bm { |x| x.report { puts pandigital }}

#  user     system      total        real
# 7652413
# 0.210000   0.020000   0.230000 (  0.205449)