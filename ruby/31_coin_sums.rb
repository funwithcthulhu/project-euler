def attempt(n)
  coins = [1,2,5,10,20,50,100]
  #coins = [10,20,50, 100]
  #coins = [1,2,5,10]
  z = 2
  count = 0
  while z < n
    t = coins.repeated_combination(z).to_a.select { |arr| arr.inject(:+) == 200 }
    #p t
    count += t.size
    z += 1
  end
  puts count
end

# attempted port in crystal. code fails for input 2/2 memory