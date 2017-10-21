def palindrome num
  num.to_s == num.to_s.reverse ? true : false
end

array = (100..999).to_a 
products = []
array.each {|a| array.each { |b| products.push(a*b) if palindrome a*b }}
products.sort.last 