puts "How many numbers from the sequence would you like to see?"
a = gets.chomp.to_i

def fib(n)
  return n > 1 ? fib(n-1) + fib(n-2) : n
end
a.times { |i| puts fib(i) }
