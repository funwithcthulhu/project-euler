require 'benchmark'

def power_sum(n, exp)
  arr = []
  num_arr = n.to_s.split(//).map(&:to_i)
  num_arr.each do |dig|
    arr << dig**exp
  end
  arr.inject(:+) == n
end

digit_power =->(start, finish, exp) {(start..finish).select { |num| power_sum(num, exp)}.inject(:+)}

Benchmark.bm do |x|
  x.report('5: ') { puts fifth_power[1000, 999999, 5] }
end

#       user     system      total        real
# 5: 443839
#     6.220000   0.010000   6.230000 (  6.244597)