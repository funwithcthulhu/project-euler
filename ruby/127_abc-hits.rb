require 'prime'
require 'benchmark'

def radical(n)
  product = 1
  Prime.prime_division(n).each do |x|
    product *= x[0]
  end
  product
end

def find(lim)
  hits = []
  rads = (1..lim).map { |x| radical(x) }
  rads.unshift(0)
  rads.each_index do |a|
    next if a.zero?
    rads.each_index do |b|
      break if (a + b) >= lim
      next unless rads[b] > rads[a]
      next unless a.gcd(b) == 1
      next unless (rads[a] * rads[b]  * rads[a + b]) < a + b
      hits << a + b
    end
  end
  hits
end

def sum(lim)
  hits = find(lim)
  puts hits.reduce(:+)
end

Benchmark.bm do |x|
  x.report("#{ARGV[0]}: ") { sum(ARGV[0].to_i) }
end

######
# user     system      total        real
# 18407904
# 1391.720000   5.670000 1397.390000 (1536.916336)
