require 'prime'

def radical(n)
  product = 1
  Prime.prime_division(n).each do |x|
    product *= x[0]
  end
  product
end

e = (1..100000).map { |n| [radical(n), n] }.sort!

e[9999][1]

# => 21417
