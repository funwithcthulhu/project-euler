require "benchmark"

def palindrome?(n)
  n.to_s.reverse.to_i == n
end

def lychrel(n, c = 1)
  return true if c >= 50
  if palindrome?(n + n.to_s.reverse.to_i)
    #return "#{n + n.to_s.reverse.to_i} #{c}"
    return false
  else
    lychrel((n + n.to_s.reverse.to_i), c += 1)
  end
end

def sequence(limit)
  (1...limit).select { |n| lychrel(n) }.size
end

Benchmark.bm do |x|
  x.report("10_000: ") { puts sequence(10_000) }
  #x.report("100_000: ") { puts sequence(100_000) }
  #x.report("1_000_000: ") { puts sequence(1_000_000) }
end
