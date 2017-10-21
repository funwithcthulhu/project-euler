require "benchmark"

def palindrome?(a)
  b = a.to_s(2)
  return false unless a == a.to_s.reverse.to_i
  return false unless b == b.reverse
  true
end

seq = ->(lim : Int32) { (0...lim).select { |x| palindrome?(x)}.sum }

puts seq.call(1_000_000)

Benchmark.bm do |x|
  x.report("1_000_000: ") { puts seq.call(1_000_000) }
end

# user     system      total        real
# 1_000_000:  872187
#  0.170000   0.070000   0.240000 (  0.179043)