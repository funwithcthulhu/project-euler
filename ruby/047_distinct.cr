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

def pfactor(x, sz)
  (1..x).map do |i|
    i if x % i == 0 && isPrime(i)
  end
  .compact
  .size > sz
end

def find(beg, lim, sz)
  (beg..lim).each_cons(4) do |c|
    if pfactor(c[0], sz) && pfactor(c[1], sz) && pfactor(c[2], sz) && pfactor(c[3], sz)
      return c
    end 
  end
end

Benchmark.bm do |x|
  x.report("4 consec: ") { puts find(100_000, 200_000, 3) }
end

#   user     system      total        real
# 4 consec:  [134043, 134044, 134045, 134046]
# 31.570000   2.690000   34.260000 (  32.080450)