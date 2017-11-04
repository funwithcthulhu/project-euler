"""
Project Euler Problem 9
Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

------------------------------------------------

naive brute force in Ruby
"""
# Note (11/3/2017): This was one of the first problems I solved on 
# Project Euler as I began learning to program.
# I returned to this problem today in C.
# I think it's pretty neat to be able to come back to this problem,
# resolve it, and see how far I've progressed as a programmer
#
# The code immediately below is my original solution from this summer.
# It's very slow. I haven't timed it, and didn't feel like waiting to time it
# at this time. The code below that is the solution I wrote today in C,
# translated into Ruby, without looking at my original solution.
# It solves the problem instantly.

def product(matrix)
  sums = matrix.map { |x| x.inject(:*) }
  sums.each { |x| puts x }
end

def find_triplet(num)
  array = []
  (1..num).each do |a|
    (1..num).each do |b|
      (1..num).each do |c|
        array.push([a,b,c]) if a + b + c == num
      end
    end
  end
  ans = array.select { |x| x if (x[0]**2 + x[1]**2) == x[2]**2 }
  product(ans)
end

# new solution:
(1..1000).each do |a|
  ((a + 1)..1000).each do |b|
    c = Math.sqrt(a**2 + b**2)
    if (a + b + c == 1000) && (a**2 + b**2 == c**2)
      puts (a * b * c).to_i
      break
    end
  end
end
# => 31875000