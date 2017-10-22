require "benchmark"
require "big/big_int.cr"

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
  sum = BigInt.new("1")
  factors.each do |sub_array|
    sum *= BigInt.new("1") + sub_array
    sum %= 1_000_000_009
  end
  sum
end

def factors(n : Int64)
  two = BigInt.new("2")
  primes = [] of BigInt
  (2_i64..n).each do |x|
    count = BigInt.new("0")
    if isPrime(x)
      x = BigInt.new(x)
      i = BigInt.new("1")
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
  x.report("#{ARGV[0]}") { puts unitary_sum(ARGV[0].to_i64) }
end
