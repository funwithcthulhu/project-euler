require 'benchmark'

def palindrome?(a)
  b = a.to_s(2)
  return false unless a == a.to_s.reverse.to_i
  return false unless b == b.reverse
  true
end

seq = ->(lim) { (0...lim).select { |x| palindrome?(x)}.inject(:+) }

Benchmark.bm do |x|
  x.report('one mill: ') { puts seq[1_000_000] }
end

# user     system      total        real
# one mill: 872187
#  0.640000   0.000000   0.640000 (  0.648559)