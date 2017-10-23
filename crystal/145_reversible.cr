# Note:
# It appears using modulo increases the speed of the reversible?
# method dramatically with larger numbers
# The cutoff seems to be around 1 million in Ruby with drastically
# increasing speeds (with lambda) and drastically faster
# speeds with modulo
#
# In crystal the transition is clear around 1 million.

require "benchmark"

# faster above 1 million
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

# faster below 1 million
def lreversible?(number : Int64)
  rev = ->(n : Int64) { n.to_s.reverse.to_i64 }
  x = rev.call(number)
  return false unless number == rev.call(x)
  sum = number + x
  return false unless sum.odd?
  sum.to_s.split(//).map(&.to_i64).each do |x|
    return false unless x.odd?
  end
  true
end

BILLION = 10_i64**9_i64

def count(limit : Int64)
  count = 0_i64
  (1_i64...limit).step(2_i64).each do |candidate|
    count += 1_i64 if reversible?(candidate)
  end
  puts count * 2_i64
end

def lcount(limit : Int64)
  count = 0_i64
  (1_i64...limit).step(2_i64).each do |candidate|
    count += 1_i64 if lreversible?(candidate)
  end
  puts count * 2_i64
end

Benchmark.bm do |x|
  x.report("10_000: ") { count(10_000_i64) }
  x.report("100_000: ") { count(100_000_i64) }
  x.report("1_000_000: ") { count(1_000_000_i64) }
  x.report("10_000_000: ") { count(10_000_000_i64) }
  x.report("100_000_000: ") { count(100_000_000_i64) }
  x.report("BILLION ") { count(BILLION) }
  x.report("L10_000: ") { lcount(10_000_i64) }
  x.report("L100_000: ") { lcount(100_000_i64) }
  x.report("L1_000_000: ") { lcount(1_000_000_i64) }
  x.report("L10_000_000: ") { lcount(10_000_000_i64) }
  x.report("L100_000_000: ") { lcount(100_000_000_i64) }
  x.report("LBILLION ") { lcount(BILLION) }
end


# user     system      total        real
# 10_000:        720
#  0.000000   0.000000   0.000000 (  0.000564)
# 100_000:       720
#  0.000000   0.000000   0.000000 (  0.000599)
# 1_000_000:     18720
#  0.000000   0.000000   0.000000 (  0.006197)
# 10_000_000:    68720
#  0.070000   0.000000   0.070000 (  0.071189)
# 100_000_000:   608720
#  0.780000   0.000000   0.780000 (  0.779675)
# BILLION        608720
#  8.750000   0.040000   8.790000 (  8.836487)
# L10_000:       720
#  0.000000   0.000000   0.000000 (  0.002566)
# L100_000:      720
#  0.030000   0.010000   0.040000 (  0.024679)
# L1_000_000:    18720
#  0.260000   0.080000   0.340000 (  0.276799)
# L10_000_000:   68720
#  3.070000   0.970000   4.040000 (  3.289975)
# L100_000_000:  608720
# 33.600000   10.030000   43.630000 (  36.163306)
