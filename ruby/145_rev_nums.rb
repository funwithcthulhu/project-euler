# Note:
# It appears using modulo increases the speed of the reversible?
# method dramatically with larger numbers
# The cutoff seems to be around 1 million in Ruby with drastically
# increasing speeds (with lambda) and drastically faster
# speeds with modulo
#
# In crystal the transition is clear around 1 million.

require 'benchmark'

def reversible?(number)
  rev = ->(n) { n.to_s.reverse.to_i }
  x = rev[number]
  return false unless number == rev[x]
  sum = number + x
  return false unless sum.odd?
  sum.to_s.split(//).map(&:to_i).each do |x|
    return false unless x.odd?
  end
  true
end

def wreversible?(number)
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

BILLION = 10**9

def count(limit)
  count = 0
  (1...limit).each do |candidate|
    count += 1 if reversible?(candidate)
  end
  puts count
end

def wcount(limit)
  count = 0
  (1...limit).each do |candidate|
    count += 1 if wreversible?(candidate)
  end
  puts count
end

Benchmark.bm do |x|
  x.report("10_000: ") { count(10_000) }
  x.report("100_000: ") { count(100_000) }
  x.report("1_000_000: ") { count(1_000_000) }
  x.report("10_000_000: ") { count(10_000_000) }
  #x.report("100_000_000: ") { count(100_000_000) }
  #x.report("BILLION ") { count(BILLION) }
  x.report("w10_000: ") { wcount(10_000) }
  x.report("w100_000: ") { wcount(100_000) }
  x.report("w1_000_000: ") { wcount(1_000_000) }
  x.report("w10_000_000: ") { wcount(10_000_000) }
  x.report("w100_000_000: ") { wcount(100_000_000) }
  #x.report("wBILLION ") { wcount(BILLION) }
end

# user     system      total        real
# 10_000: 720
#   0.050000   0.010000   0.060000 (  0.049089)
# 100_000: 720
#   0.410000   0.000000   0.410000 (  0.430462)
# 1_000_000: 18720
#   4.450000   0.110000   4.560000 (  4.855194)
# 10_000_000: 68720
#  47.550000   0.870000  48.420000 ( 51.205081)
# w10_000: 720
#   0.010000   0.000000   0.010000 (  0.004528)
# w100_000: 720
#   0.050000   0.000000   0.050000 (  0.051289)
# w1_000_000: 18720
#   0.570000   0.000000   0.570000 (  0.573933)
# w10_000_000: 68720
#   6.230000   0.010000   6.240000 (  6.247042)
# w10_000_000: 608720
#  68.040000   0.260000  68.300000 ( 68.644679)