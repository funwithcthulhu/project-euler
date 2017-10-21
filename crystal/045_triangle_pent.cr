require "benchmark"

def find
  a = ->(t : Int64) { Math.sqrt((t * 2_i64) - 1_i64).floor }
  tn = ->(t : Int64) { a.call(t) * (a.call(t) + 1_i64) / 2_i64 }
  is_triangle = ->(t : Int64) { tn.call(t) == t }

  b = ->(p : Int64) { Math.sqrt((2_i64 * p + 1_i64) / 3_i64).ceil }
  pn = ->(p : Int64) { b.call(p) * (3_i64 * b.call(p) - 1_i64) / 2_i64 }
  is_pentagonal = ->(p : Int64) { pn.call(p) == p }

  c = ->(h : Int64) { Math.sqrt( (h + 1_i64) / 2_i64).ceil }
  hn = ->(h : Int64) { c.call(h) * (2_i64 * c.call(h) - 1_i64) }
  is_hexagonal = ->(h : Int64) { hn.call(h) == h }

  (40756_i64..Float64::INFINITY).each do |x|
    next unless is_triangle.call(x)
    next unless is_pentagonal.call(x)
    next unless is_hexagonal.call(x)
    puts x
    break
  end
end

Benchmark.bm do |x|
  x.report("answer: ") { find }
end

# user     system      total        real
# answer:  1533776805
# 15.460000   0.080000   15.540000 (  16.151160)