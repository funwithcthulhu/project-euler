def factorial(n, sum = 1)
  return sum if n < 2
  sum *= n
  factorial(n - 1, sum) unless n < 2
end

def factorial_sum(n)
  n.to_s.split(//).map(&:to_i).map do |dg|
    factorial(dg)
  end.inject(:+) == n
end

def digit_factorial_sum(lim)
  arr = []
  (3..lim).select do |x|
    factorial_sum(x)
  end
end