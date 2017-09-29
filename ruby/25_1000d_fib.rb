timer_start = Time.now

index = -1
previous = 0
n = 1
until n.to_s.length == 1000
  index += 1
  n, previous = previous, previous + n
end

puts index
puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"

# $ ruby 25_1000d_fib.rb
# 4782
# Elapsed Time: 22.013 milliseconds