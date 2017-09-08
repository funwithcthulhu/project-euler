require 'prime'

def sum(n)
  total = 0
  (1..n).each do |x|
    total += x if x.prime?
  end
  puts total
end

n = gets.chomp.to_i
sum(n)

