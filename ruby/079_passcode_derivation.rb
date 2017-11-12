# Project Euler Problem 79 : Passcode Derivation
# November 12, 2017

# A common security method used for online banking is to ask the user
# for three random characters from a passcode. For example, if the
# passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters;
# the expected reply would be: 317.

# The text file, keylog.txt (See data at EOF), contains fifty
# successful login attempts.

# Given that the three characters are always asked for in order,
# analyse the file so as to determine the shortest possible secret
# passcode of unknown length.

# For this problem, I first use a Set (which doesn't allow duplicates)
# to log the numbers in the file. Then, I map the numbers which
# come before each number in the Set (all_nums) on each line
# of the file. Last, I remove duplicates, and order the numbers
# according to the total amount of uniq numbers which come before
# them.

# Finds the solution instantly (benchmark code has been removed):
# user     system      total        real
# 73162890
# 0.000000   0.000000   0.000000 (  0.000432)

require 'set'

log = []
code = []
befores = {}

# Get input from EOF (or file), and store it in a nested array (log)
DATA.each do |line|
  log << line.chomp.split(//).map(&:to_i)
end

# Get all uniq numbers from log
all_nums = Set.new
log.flatten.each { |n| all_nums.add(n) }

# For each uniq number, keep track of every number that comes before
# it on each line of the input file (our log) and map those numbers
# to a hash (befores)
all_nums.each do |i|
  log.each do |nums|
    befores[i] ||= []
    next unless nums.include?(i)
    idx = nums.index(i)
    if idx == 2
      befores[i] << nums[0..1]
    elsif idx == 1
      befores[i] << nums[0]
    end
  end
  # remove duplicate numbers, and flatten nested arrays
  befores[i].tap(&:flatten!).uniq! if befores[i]
end

# transform the hash values to the size of their respective array
# aka the number of uniq values which come before a number on
# any line in the input file. Then, map that value to the
# respective number in an array, join the array and print to STDOUT
befores.transform_values(&:size).each_pair do |k, v|
  code[v] = k
end

puts code.join

# 73162890

__END__
319
680
180
690
129
620
762
689
762
318
368
710
720
710
629
168
160
689
716
731
736
729
316
729
729
710
769
290
719
680
318
389
162
289
162
718
729
319
790
680
890
362
319
760
316
729
380
319
728
716