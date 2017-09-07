
def prime_factors(n)
  (2..n).each do |x|
    while n % x == 0
      n /= x
    end
    return x if n == 1
  end
end

z = gets.chomp.to_i
prime_factors(z)
