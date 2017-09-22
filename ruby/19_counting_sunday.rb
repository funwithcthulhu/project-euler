# Project Euler problem 19
#
# The challenge asks to find the # of sundays falling on
# the first of the month during the twentieth century
#
# I generalized the problem to find all Sundays in a specific range
# because I initially misread the problem
# note: currently will find number of Sundays from an initial year and month
# to the end of a year (Dec) only
#
# I've made some small tweaks to find the correct answer, but the
# code can be re-adjusted to find more general answers quite easily

DAYS =
  {
    1 => 31,
    2 => 28,
    :leap => 29,
    3 => 31,
    4 => 30,
    5 => 31,
    6 => 30,
    7 => 31,
    8 => 31,
    9 => 30,
    10 => 31,
    11 => 30,
    12 => 31
  }.freeze

# Find the number of Sundays meeting the criteria in the below method
# over a range. Currently, the range can only end in December of the end_year
def how_many_range?(start_year, start_month, end_year)
  sundays = 0
  until start_year > end_year
    until start_month > 12
      sundays += how_many_each_month?(start_year, start_month)
      start_month += 1
    end
    start_month = 1
    start_year += 1
  end
  sundays
end

# Uses a loop and Ruby's built in Time class to determine the number
# of Sundays in any given month of any given year
def how_many_each_month?(year, month)
  month = :leap if leap_year?(year)
  day = 1
  sundays = 0
  until day > DAYS[month]
    t = Time.mktime(year, month, day)
    # remove '&& day == 1, or change 1 to any day, to
    # find the number of Sundays on any specific day of
    # any given month, or a range of values using the above method
    sundays += 1 if t.sunday? && day == 1
    day += 1
  end
  sundays
end

# Leap years are years divisible by 4, but only centuries divisble by 400
def leap_year?(year)
  return false if year != 2
  return false if century?(year) && !(year % 400).zero?
  return true if (year % 4).zero?
  false
end

# A separate method might not REALLY be necessary, but it makes the above
# code cleaner
def century?(year)
  true if (year % 100).zero?
end
