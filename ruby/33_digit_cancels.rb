# Brute force algorithm I suppose, in that I check every fraction
# combination of the numbers 10..99 for non-triviality. Since we're
# only working with a small amount of numbers I figured a
# 'brute force' approach would be plenty fast (indeed it works instantly).
# Working with fractions is pretty awkward, not gonna lie.
# I am not a big fan.  

# Basically, I create an array of numbers 10..99 inclusive, then
# iterate over each number twice, once for the nominator and once
# for the denominator. I split both numbers into arrays in order to
# check if they both have a number other than zero in common. If they
# do, and the resolution of the fraction < 1, then I collect them if
# they are non-trivial. 
  
# I originally found the answer by working out the product of the
# fractions I collected by hand. However, afterwards, I went in and
# added code so that the program finds the product itself and prints
# it as a fraction. 

fractions = []
arr = (10..99).to_a
arr.each do |n|
  n_a1 = n.to_s.split(//).map(&:to_i)
  next if n_a1.include?(0)
  arr.each do |d|
    n_a = n_a1.dup
    next unless n.to_f/d.to_f < 1.0
    d_a= d.to_s.split(//).map(&:to_i)
    next unless n_a.include?(d_a[0]) || n_a.include?(d_a[1])
    target = n.to_f / d.to_f
    if n_a.include?(d_a[0])
      n_a.delete(d_a[0])
      d_a.delete(d_a[0])
      x = n_a.join.to_f / d_a.join.to_f
      fractions << [n_a, d_a] if x == target
    elsif n_a.include?(d_a[1])
      n_a.delete(d_a[1])
      d_a.delete(d_a[1])
      x = n_a.join.to_f / d_a.join.to_f
      fractions << [n_a, d_a] if x == target
    end
  end
end

fractions.map! { |a| a.flatten }

nominator = 1
denominator = 1
fractions.each do |fraction|
  nominator *= fraction[0]
  denominator *= fraction[1]
end
denominator /= nominator
nominator /= nominator
puts "#{nominator} / #{denominator}"
# 1 / 100
