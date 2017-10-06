require 'prime'

def pfactor(x)
  (1..x).map do |i|
    i if x % i == 0 && i.prime?
  end
  .compact
  .size > 3
end

def find(limit)
  (10_000..limit).map do |y|
    y if pfactor(y) && (pfactor(y - 1) || pfactor(y + 1))
  end
  .compact
end
