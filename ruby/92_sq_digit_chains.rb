def digit_chain(x, cnt = [])
  v = x.to_s.split(//).map(&:to_i).map { |x| x**2 }.inject(:+)
  cnt << v
  return cnt.last if v == 1 || v == 89
  digit_chain(v, cnt)
end

def digit_chain_sum(limit)
  (1...limit).select do |x|
    digit_chain(x) == 89
  end.count
end

# Runs in 268 seconds in Ruby
# user     system      total        real
# 263.490000   1.440000 264.930000 (268.817043)

# By comparison, non-release compiled crystal runs in 86 seconds
# and release compuled crystal finishes in 25 seconds