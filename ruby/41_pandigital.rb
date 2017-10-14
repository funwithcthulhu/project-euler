require 'benchmark'
require 'prime'

def pandigital
  source = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  primes = []
  while source.size > 4
    temp = source.permutation(source.size).to_a.map { |x| x.join.to_i }
    primes << temp.select { |c| c.prime? }
    break if !primes.flatten.empty?
    source.pop
  end
  primes.flatten.sort.last
end

Benchmark.bm { |x| x.report { puts pandigital }}

#  user     system      total        real
#  7652413
#  1.630000   0.030000   1.660000 (  1.671086)