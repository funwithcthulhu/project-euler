require "benchmark"
require "big/big_int.cr"

def mod_exp(b : Int64, exp : Int64, mod)
  prod = 1_i64
  base = b % mod
  until exp.zero?
    prod = (prod * base) % mod if exp.odd?
    exp >>= 1_i64
    base = (base * base) % mod
  end
  prod
end

def isPrime(n : Int64)
  if n == 1_i64
    false
  elsif n < 4_i64
    true
  elsif (n % 2_i64).zero?
    false
  elsif n < 9_i64
    true
  elsif (n % 3_i64).zero?
    false
  else
    r = Math.sqrt(n).floor
    f = 5_i64
    while f <= r
      return false if (n % f).zero?
      return false if (n % (f + 2_i64)).zero?
      f += 6_i64
    end
  true
  end
end

def unitary_sum(num : Int64)
  factors = factors(num)
  sum = 1_i64
  factors.each do |sub_array|
    sum *= 1_i64 + sub_array
    sum %= 1_000_000_009_i64
  end
  sum
end

def factors(n : Int64)
  primes = [] of Int64
  c = 0_i64
  l = 1_i64
  until 2_i64**l > n
    c += (n / 2_i64**l)
    l += 1_i64
  end
  primes << mod_exp((2_i64 * 2_i64), c, 1_000_000_009_i64)
  (3_i64..n).step(2_i64).each do |x|
    count = 0_i64
    if isPrime(x)
      i = 1_i64
      until x**i > n
        count += (n / x**i)
        i += 1
      end
      primes << mod_exp((x * x), count, 1_000_000_009_i64)
      #primes << (x*2)**count
    end
  end
  primes
end

Benchmark.bm do |x|
  x.report("#{ARGV[0]}") { puts unitary_sum(ARGV[0].to_i64) }
end
