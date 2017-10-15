def pentagonal(n)
  n * (3 * n - 1) / 2
end

def isPent?(n)
  PENTS.include?(n)
end

PENTS = (1..10_000).map do |n|
  pentagonal(n)
end

D = nil
J = 1
K = 1
P = 1
(1_000..10_000).each do |j|
  (1_000..10_000).each do |k|
    if isPent?(pentagonal(j) - pentagonal(k)) && isPent?(pentagonal(j) + pentagonal(k))
      D ||= (pentagonal(j) - pentagonal(k))
      if (pentagonal(j) - pentagonal(k)) < D
        P = pentagonal(pentagonal(j) - pentagonal(k))
        K = pentagonal(k)
        J = pentagonal(j)
        D = pentagonal(j) - pentagonal(k)
      end
    end
  end
end