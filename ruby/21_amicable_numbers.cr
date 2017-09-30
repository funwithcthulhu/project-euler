timer_start = Time.now

def divisors(number : Int)
  arr = (1..Math.sqrt(number)).select do |val|
    (number % val).zero?
  end
  new_arr = [] of Int32
  arr.each do |val|
    new_arr << val
    new_arr << number / val unless val == number / val
  end
  new_arr.sort!.delete(number)
  return new_arr
end


def amicable?(number)
  possible = divisors(number).sum
  divisors(possible).sum == number && possible != number
end

def amicable_sum(limit)
  (2...limit).select do |number|
    amicable?(number)
  end.sum
end

puts amicable_sum(10_000)
puts "Elapsed Time: #{(Time.now - timer_start)*1000} ms"