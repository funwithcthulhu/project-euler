require "benchmark"

def palindrome?(n : Int64)
  number = n
  reversed = 0_i64
  while number > 0_i64
    reversed = 10_i64 * reversed + number % 10_i64
    number /= 10_i64
  end
  reversed == n
end

CHAL = 10_i64**8_i64
SQRT = Math.sqrt(10_i64**8_i64).floor.to_i64


def find
  sum = 0_i64
  cache = [] of Int64
  (1_i64..SQRT).each do |i|
    num = i**2_i64
    ((i + 1_i64)..SQRT).each do |j|
      num += j**2_i64
      break if num > CHAL
      if palindrome?(num) && !cache.includes?(num)
        sum += num
        cache << num
      end
    end
  end
  puts sum
end

Benchmark.bm { |x| x.report("answer: ") { find }}

# user     system      total        real
# answer:  2906969179
# 0.000000   0.000000   0.000000 (  0.005874)
