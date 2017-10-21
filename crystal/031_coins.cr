require "Benchmark"

def attempt(n)
  coins = [1,2,5,10,20,50,100]
  z = 2
  count = 0
  while z < n
    t = coins.repeated_combinations(z).to_a.select { |arr| arr.sum == 200 }
    count += t.size
    z += 1
  end
  puts count
end

Benchmark.bm do |x|
  x.report("10: ") { attempt(10) }
  x.report("20: ") { attempt(20) }
  x.report("200: ") { attempt(200) }
end

# user     system      total        real
# 10:   36
#   0.000000   0.000000   0.000000 (  0.002517)
# 15:   276
#   0.020000   0.000000   0.020000 (  0.016488)
# 20:   1046
#   0.080000   0.010000   0.090000 (  0.074460)
# 25:   2603
#   0.360000   0.030000   0.390000 (  0.318842)
# 30:   5056
#   1.120000   0.070000   1.190000 (  1.019932)
# 50:   	GC Warning: Repeated allocation of very large block (appr. size 100667392):
# 	May lead to memory leak and poor performance
#
# UPDATE: attempted w/ input of 200 (for solution). Program aborted 2/2 not enough
# memory allocated for heap