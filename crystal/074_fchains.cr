def fsum(n)
  digits = n.to_s.split(//).map(&.to_i)
  sum = 0
  digits.map! { |d| d.zero? ? 1 : d }
  digits.each do |d|
    sum += (1..d).to_a.reduce { |a, v| a * v}
  end
  sum
end

def chain(n, l, arr = [] of Int32)
  sum = fsum(n)
  return l if arr.includes?(sum)
  arr << sum
  l += 1
  chain(sum, l, arr)
end

count = 0
(1..ARGV[0].to_i).each do |candidate|
  count += 1 if chain(candidate, 1) == 60
end

puts count
# => 402
