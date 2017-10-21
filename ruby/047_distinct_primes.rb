require 'prime'
require 'benchmark'

def pfactor(x, sz)
  (1..x).map do |i|
    i if x % i == 0 && i.prime?
  end
  .compact
  .size > sz
end

def find(beg = 10_000, lim, sz)
  (beg..lim).each_cons(4) do |a, b, c, d|
    if pfactor(a, sz) && pfactor(b, sz) && pfactor(c, sz) && pfactor(d, sz)
      return "#{a}, #{b}, #{c}, #{d}"
    end 
  end
end

Benchmark.bm do |x|
  x.report("4 consec: ") { puts find(100_000, 200_000, 3)}
end