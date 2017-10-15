def pentagonal(n)
  n * (3 * n - 1) / 2
end

def isPent?(n)
  PENTS.includes?(n)
end

PENTS = (1..1_00_000).map do |n|
  pentagonal(n)
end

d = nil
j = 1
k = 1
p = 1
(1_000..10_000).each do |j|
  (1_000..10_000).each do |k|
    if isPent?(pentagonal(j) - pentagonal(k)) && isPent?(pentagonal(j) + pentagonal(k))
      d ||= (pentagonal(j) - pentagonal(k))
      if (pentagonal(j) - pentagonal(k)) < d
        p = pentagonal(pentagonal(j) - pentagonal(k))
        k = pentagonal(k)
        j = pentagonal(j)
        d = pentagonal(j) - pentagonal(k)
      end
    end
  end
end

puts d
puts p
puts j
puts k