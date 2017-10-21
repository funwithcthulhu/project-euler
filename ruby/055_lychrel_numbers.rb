require 'benchmark'

def lychrel(n, c = 1)
  r = n.to_s.reverse.to_i
  p = n + r
  return true if c >= 50
  return nil if n == r
  lychrel(p, c += 1)
end

seq = ->(limit) { (1...limit).select { |n| lychrel(n) }.size }

Benchmark.bm do |x|
  x.report('10_000: ') { puts seq[10_000] }
  x.report('100_000: ') { puts seq[100_000] }
  x.report('1_000_000: ') { puts seq[1_000_000] }
end

# user     system      total        real
# 10_000: 246
#  0.030000   0.000000   0.030000 (  0.026446)
# 100_000: 6136
#  0.470000   0.000000   0.470000 (  0.476074)
# 1_000_000: 118958
#  7.540000   0.020000   7.560000 (  7.573954)
