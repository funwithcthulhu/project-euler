require "benchmark"

def reversible?(number : Int64)
  return false if (number % 10).zero?
  n = number
  reversed = 0
  while number > 0
    reversed = 10 * reversed + number % 10
    number /= 10
  end
  reversed += n
  while reversed > 0
    return false if ((reversed % 10) % 2 == 0)
    reversed /= 10
  end
  true
end

BILLION = 10_i64**9_i64

def count(limit : Int64)
  count = 0_i64
  (1_i64...limit).step(2).each do |candidate|
    count += 1_i64 if reversible?(candidate)
  end
  puts count * 2
end

Benchmark.bm do |x|
  x.report("10_000: ") { count(10_000_i64) }
  x.report("100_000: ") { count(100_000_i64) }
  x.report("1_000_000: ") { count(1_000_000_i64) }
  x.report("10_000_000: ") { count(10_000_000_i64) }
  x.report("BILLION ") { count(BILLION) }
end

# user     system      total        real
# 10_000:      720
#  0.000000   0.000000   0.000000 (  0.000604)
# 100_000:     720
#  0.000000   0.000000   0.000000 (  0.000611)
# 1_000_000:   18720
#  0.010000   0.000000   0.010000 (  0.008013)
# 10_000_000:  68720
#  0.080000   0.000000   0.080000 (  0.080471)
# BILLION      608720
#  8.770000   0.010000   8.780000 (  8.841602)
