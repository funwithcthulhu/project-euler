require "benchmark"

def prime_factors(n)
  arr = [] of Int32
  while (n % 2).zero?
    arr << 2
    n = n / 2
  end
  (3..(Math.sqrt(n) + 1).to_i).step(2).each do |i|
    while (n % i).zero?
      arr << i
      n = n / i
    end
  end
  arr << n if n > 2
  arr.uniq
end

def totient(n, divisors)
  running_tot = n
  divisors.each do |factor|
    running_tot *= (1.0 - (1.0/factor.to_f))
  end
  running_tot
end

def permutation?(a, b)
  a.to_i.to_s.split(//).sort == b.to_i.to_s.split(//).sort
end

def totient_perm(limit)
  possible = [] of Int32
  (2..limit).each do |cand|
    temp = totient(cand, prime_factors(cand))
    if permutation?(temp, cand)
      possible << cand
    end
  end
  possible
end

def totient_min(array)
  min = 10
  n = 0
  array.each do |i|
    temp = totient(i, prime_factors(i))
    if i.to_f / temp <= min
      min = i.to_f / temp
      n = i
    end
  end
  n
end

Benchmark.bm do |x|
  x.report("answer: ") { puts totient_min(totient_perm(10**7)) }
end

# user     system      total        real
# answer:  8319823
# 143.000000   9.120000   152.120000 (  146.234636)
