require 'prime'

last = nil
length = 0
(2..1_000).each do |c|
  Prime.each_cons(c) do |cons|
    last = cons if cons.sum < 1_000_000 && cons.sum.prime? && c > length
    break if cons.sum > 1_000_000
  end
end

# >> last.sum
# => 997651
