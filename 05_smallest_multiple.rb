=begin
2520 is the smallest number that can be divided by each of
the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible
by all of the numbers from 1 to 20?
=end
def smallest_multiple(n)
  start = n
  num = start
  loop do
    (n % num).zero? ? num -= 1 : num = start
    num.zero? (return n + 1) : (n += 1)
  end
end
