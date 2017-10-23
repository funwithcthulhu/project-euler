require "benchmark"
require "big/big_int.cr"

def test(o : BigInt)
  puts power(o,o)
end

def power(n : BigInt, exponent : BigInt)
  prod = BigInt.new("1")
  while exponent > 0
    prod *= n if (exponent & 1) != 0
    n *= n
    exponent >>= 1
  end
  prod
end

Benchmark.bm do |x|
  #x.report("12345") { test(BigInt.new("1234"))}
  x.report("1234: ") { test(BigInt.new("1234")).to_s.size }
  x.report("*: ") { p (1234123**123456).to_s.size }
end

require "benchmark"
require "big/big_int.cr"

def power(n : BigInt, exponent : BigInt)
  prod = BigInt.new("1")
  while exponent > 0
    prod *= n if (exponent & 1) != 0
    n *= n
    exponent >>= 1
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
  #factors = Prime.prime_division(num) .. finds for num
  factors = factors(num) # finds for num!
  sum = BigInt.new("1")
  factors.each do |sub_array|
    #sum *= (BigInt.new("1") + (sub_array[0]**2)**sub_array[1])
    #sum *= (1_i64 + sub_array)
    sum *= BigInt.new("1") + sub_array
  end
  sum.to_s.size
end

def factors(n : Int64)
  primes = [] of BigInt #Array(UInt64)
  (2_i64..n).each do |x|
    count = BigInt.new("0")
    #count = 0_u64
    if isPrime(x)
      x = BigInt.new(x)
      two = BigInt.new("2")
      i = BigInt.new("1")
      until x**i > n
        count += (n / x**i)
        i += 1
      end
      #primes << [x, count]
      primes << (x**2)**count
      #primes << power((x**2),count)
      #x = BigInt.new(x)
      #two = BigInt.new("2")
      #primes << power(x**two, count)
    end
  end
  primes
end

Benchmark.bm do |x|
  x.report("4: ") { puts unitary_sum(4_i64) }
  x.report("100: ") { puts unitary_sum(100_i64) }
  x.report("1_000: ") { puts unitary_sum(1_000_i64) }
  x.report("10_000: ") { puts unitary_sum(10_000_i64) }
  x.report("100_000: ") { puts unitary_sum(100_000_i64) }
  x.report("1_000_000: ") { puts unitary_sum(1_000_000_i64) }
  #x.report("10_000_000: ") { puts unitary_sum(10_000_000_u64) }#% 100_000_009 }
  #x.report("100_000_000: ") { puts unitary_sum(100_000_000_u64) % 1_000_000_009 }
end
