# Project Euler Problem 93 Arithmetic Expressions
# November 14, 2017

# By using each of the digits from the set, {1, 2, 3, 4}, exactly
# once, and making use of the four arithmetic operations (+, −, *, /)
# and brackets/parentheses, it is possible to form different positive
# integer targets.

# For example,

# 8 = (4 * (1 + 3)) / 2
# 14 = 4 * (3 + 1 / 2)
# 19 = 4 * (2 + 3) − 1
# 36 = 3 * 4 * (2 + 1)

# Note that concatenations of the digits, like 12 + 34, are not allowed.

# Using the set, {1, 2, 3, 4}, it is possible to obtain thirty-one
# different target numbers of which 36 is the maximum, and each of
# the numbers 1 to 28 can be obtained before encountering the first
# non-expressible number.

# Find the set of four distinct digits, a < b < c < d, for which the
# longest set of consecutive positive integers, 1 to n, can be obtained,
# giving your answer as a string: abcd.

# Kinda slow, kinda messy solution in Ruby, but I'm coming in under 60
# seconds and happy to have solved it at all. I abuse eval and brute
# force my way to the finish line... for each a, b, c, d combination I
# am basically creating every possible permutation of number and operator
# expressions, then manually entering in the parentheses and adding all
# the new expressions to an array, then solve that array and map all the
# positive integer targets to a hash, then grab those hash keys into an
# array to check the length of consecutive numbers, keeping track of the
# biggest ones, and finally printing abcd as a string after I've gone
# through all the different a, b, c, d combinations allowed. Whew.
# It's a miracle it finishes all that in under a minute! 48 seconds with
# some small optimizations gleaned from this thread. ^_^

# user     system      total        real
# 1258
# 63.560000   0.350000  63.910000 ( 64.492519)

# user     system      total        real
# 1258
# 48.620000   0.170000  48.790000 ( 48.906598)

require 'benchmark'

class Problem93
  attr_reader :eqs, :eqs1, :consec, :cache
  def initialize(a, b, c, d)
    @nums = [a.to_f, b.to_f, c.to_f, d.to_f]
    @ops = ['*', '+', '-', '/']
    make_combos
    make_eqs
    make_eqs1
    make_cache
    find_consec
  end
  
  def make_combos
    @num_combos = @nums.permutation(4).to_a
    @op_combos = @ops.repeated_permutation(3).to_a
  end

  def make_eqs
    @eqs = []
    @num_combos.each do |num|
      @op_combos.each do |op|
        @eqs << "#{num[0]} #{op[0]} #{num[1]} #{op[1]} #{num[2]} #{op[2]} #{num[3]}"
      end
    end
  end

  def make_eqs1
    @eqs1 = []
    @eqs.each do |arr|
      @eqs1 << arr
      @eqs1 << arr.dup.insert(0, '(').insert(10, ')') # => "(4.0 / 3.0) / 2.0 / 1.0"
      @eqs1 << arr.dup.insert(0, '(').insert(17, ')') # => "(4 / 3 / 2) / 1" done
      @eqs1 << arr.dup.insert(0, '(').insert(7, '(').insert(18, ')').insert(19, ')') #=> "(4 / (3 / 2)) / 1"
      @eqs1 << arr.dup.insert(6, '(').concat(')') # => "4 /( 3 / 2 / 1)"
      @eqs1 << arr.dup.insert(6, '(').insert(13, '(').concat('))') #=> "4 /( 3 /( 2 / 1))"
      @eqs1 << arr.dup.insert(6, '(').insert(17, ')') #=> "4 /( 3 / 2) / 1"
      @eqs1 << arr.dup.insert(12, '(').concat(')') #=> "4 / 3 / (2 / 1)"
    end
  end

  def make_cache
    @cache = {}
    @eqs1.each do |arr|
      temp = eval(arr) rescue ZeroDivisionError
      check = temp.floor rescue FloatDomainError
      @cache[temp.to_i] = arr if check == temp && temp > 0
    end
  end

  def find_consec
    @consec = 0
    targets = @cache.keys.sort
    targets.each_with_index do |a, x|
      if targets[x + 1] == a + 1
        @consec += 1
      else
        break
      end
    end
  end
end

def find
  biggest = 0
  numbers = ''
  (1..4).each do |a|
    (a..9).each do |b|
      (b..8).each do |c|
        (c..9).each do |d|
          temp = Problem93.new(a, b, c, d).consec
          if temp > biggest
            numbers = a.to_s + b.to_s + c.to_s + d.to_s
            biggest = temp
          end
        end
      end
    end
  end
  puts numbers
end

Benchmark.bm { |x| x.report { find }}
