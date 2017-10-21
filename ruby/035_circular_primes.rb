require 'prime'
require 'benchmark'

def circular?(n)
  s = n.to_s.size
  arr = n.to_s.split(//).map(&:to_i)
  count = 0
  while count < s
    return false unless arr.join.to_i.prime?
    return false unless arr.rotate(count).join.to_i.prime?
    count += 1
  end
  true
end

def count_circulars(lim)
  (1..lim).step(2).select do |number|
    circular?(number)
  end.size + 1
end

Benchmark.bm do |x|
  x.report('no step: ') { puts count_circulars(1_000_000) }
end

#        user     system      total        real
#   no step: 55
#      5.470000   0.040000   5.510000 (  5.572924)
