require 'benchmark'

def incr(number)
  arr = number.to_s.split(//).map(&:to_i)
  arr == arr.sort
end

def decr(number)
  arr = number.to_s.split(//).map(&:to_i)
  arr == arr.sort.reverse
end

def tab(proportion)
  non = 0
  bouncy = 0
  @last = 0
  (1..Float::INFINITY).each do |candidate|
    non += 1 if incr(candidate) || decr(candidate)
    bouncy += 1 if !incr(candidate) && !decr(candidate)
    @last = candidate
    break if bouncy.to_f / (non.to_f + bouncy.to_f) == proportion
  end
  puts @last
end

Benchmark.bm do |x|
  x.report("50%: ") { tab(0.5) }
  x.report("90%: ") { tab(0.9) }
  x.report("99%: ") { tab(0.99) }
end

# user     system      total        real
# 50%: 538
# 0.010000   0.000000   0.010000 (  0.007629)
# 90%: 21780
# 0.450000   0.000000   0.450000 (  0.451168)
# 99%: 1587000
# 41.130000   0.190000  41.320000 ( 41.605658)
