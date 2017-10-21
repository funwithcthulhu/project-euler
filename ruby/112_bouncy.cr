require "benchmark"

def incr(number)
  arr = number.to_s.split(//).map(&.to_i)
  arr == arr.sort
end

def decr(number)
  arr = number.to_s.split(//).map(&.to_i)
  arr == arr.sort.reverse
end

def tab(proportion : Float64)
  non = 0
  bouncy = 0
  last = 0
  (1..Float64::INFINITY).each do |candidate|
    non += 1 if incr(candidate) || decr(candidate)
    bouncy += 1 if !incr(candidate) && !decr(candidate)
    last = candidate
    break if bouncy.to_f / (non.to_f + bouncy.to_f) == proportion
  end
  puts last
end

Benchmark.bm do |x|
  x.report("50%: ") { tab(0.5_f64) }
  x.report("90%: ") { tab(0.9_f64) }
  x.report("99%: ") { tab(0.99_f64) }
end

# user     system      total        real
# 50%:  538
# 0.000000   0.000000   0.000000 (  0.002391)
# 90%:  21780
# 0.070000   0.020000   0.090000 (  0.072222)
# 99%:  1587000
# 5.300000   1.540000   6.840000 (  5.795595)
