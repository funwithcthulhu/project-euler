require 'benchmark'

def reversible?(number)
  rev = ->(n) { n.to_s.reverse.to_i }
  return false unless number == rev[rev[number]]
  sum = number + rev[number]
  return false unless sum.odd?
  sum.to_s.split(//).map(&:to_i).each do |x|
    return false unless x.odd?
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

Benchmark.bm do |x|
  x.report("10_000: ") { count(10_000) }
  x.report("100_000: ") { count(100_000) }
  x.report("1_000_000: ") { count(1_000_000) }
  x.report("10_000_000: ") { count(10_000_000) }
  x.report("BILLION ") { count(BILLION) }
end