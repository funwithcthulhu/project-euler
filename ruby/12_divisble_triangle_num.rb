# Project Euler problem 12

# returns the first triangle number "n" that has the minimum number
# of specified divisors: divisor_lim
# if no number of divisors specified, then finds the first
# triangle number with more than 5 divisors
def triangle_factors(n, divisor_lim = nil)
  divisor_lim ||= 5
  return triangle(n) if factors(triangle(n)).size > divisor_lim
  triangle_factors(n + 1, divisor_lim)
end

# finds the nth triangle number
def triangle(n)
  start = 1
  num = 0
  until start > n
    num += start
    start += 1
  end
  num
end

# finds all factors of a number, n
# optimized O(log n) ??
def factors(n)

  # increments from 1 to the sqrt of n, selecting
  # numbers that are divisible
  (1..Math.sqrt(n)).select do |val|
    (n % val).zero?

  # adds divisble numbers to an arr. divides n by the divisor, i,
  # and adds that number if it does not equal n
  end.inject([]) do |arr, i|
    arr << i
    arr << n / i unless i == n / i
    arr
  end.sort
end
