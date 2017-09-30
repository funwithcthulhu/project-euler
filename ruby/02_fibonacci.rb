puts "How many numbers from the sequence would you like to see?"
a = gets.chomp.to_i

def fib(n)
  return n > 1 ? fib(n-1) + fib(n-2) : n
end
puts a.times { |i| fib(i).even? }


# The below code is orders of magnitude faster than 
# the recursive solution above
#
# I cannot figure why this solution is so, so fast
#
# I encountered similar code as a solution to a project euler
# challenge posted on the net 5+ years ago
# The author complained that the code was very slow.
#
# The author must have been using < 1.9
def fib(count)
  prev = 0
  n = 1
  x = 0
  until x > count
    n, prev = prev, prev + n
    x += 1
  end
  n
end

# Testing to see if the parallel variable assn has 
# anything to do with the speed... it does not. 
  def fib(count)
    prev = 0
    n = 1
    x = 0
    until x > count
      temp = n
      n = prev
      prev = prev + temp
      x += 1
    end
    n
  end