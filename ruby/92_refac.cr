require "benchmark"

def digit_chain(x : Int64)
  v = x.to_s.split(//).map(&.to_i64).map { |x| x * x }.sum
  return v if v == 1_i64 || v == 89_i64
  digit_chain(v)
end

def digit_chain_sum(limit : Int64)
  (1_i64...limit).each do |x|
    digit_chain(x) == 89_i64
  end.size
end

puts Benchmark.measure { digit_chain_sum(10_000_000_i64) }

# this code brings time down to 22s from ~25s just by removing the arr from digit_chain