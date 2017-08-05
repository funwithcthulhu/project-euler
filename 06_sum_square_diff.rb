def sum_square_diff(n)

  def sum_of_squares(n)
    (n*(n+1)*((2*n)+1))/6
  end

  def square_of_sum(n)
    sum = (1..n).inject { |sum, element| sum + element }
    sumsquare = sum**2
  end

  return square_of_sum(n) - sum_of_squares(n)
end
