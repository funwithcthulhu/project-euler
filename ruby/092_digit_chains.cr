require "benchmark"

def digit_chain(x : Int64, cnt = [] of Int64)
  v = x.to_s.split(//).map(&.to_i64).map { |x| x * x }.sum
  cnt << v
  return cnt.last if v == 1_i64 || v == 89_i64
  digit_chain(v, cnt)
end

def digit_chain_sum(limit : Int64)
  (1_i64...limit).select do |x|
    digit_chain(x) == 89_i64
  end.size
end

puts Benchmark.measure { digit_chain_sum(10_000_000_i64) }

# benchmark w/o compiling w/ release
# $ crystal 92_digit_chains.cr
# 86.080000   0.550000   86.630000 (  88.343989)

# benchmark after compiling w/ release--WOAH
# $ ./92_digit_chains
# 24.640000   0.380000   25.020000 (  25.119664)