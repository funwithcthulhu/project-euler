require "benchmark"

def lychrel(n : Int64, c = 1)
  r = n.to_s.reverse.to_i64
  p = n + r
  return true if c >= 50
  return false if n == r
  lychrel(p, c += 1)
end

seq = ->(limit : Int64) { (1_i64...limit).select { |n| lychrel(n) }.size }

Benchmark.bm do |x|
  x.report("1000: ") { puts seq.call(1000_i64) }
  x.report("10_000: ") { puts seq.call(10_000_i64) }
  x.report("100_000: ") { puts seq.call(100_000_i64) }
  x.report("1_000_000: ") { puts seq.call(1_000_000_i64) }
end
