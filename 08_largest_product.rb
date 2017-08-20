def product(digit)
  product_array = []
  digit = digit.delete("\n").split('').map(&:to_i)
  digit.each_with_index do |num, i|
    digit1 = digit[i+1]
    digit2 = digit[i+2]
    digit3 = digit[i+3]
    digit4 = digit[i+4]
    digit5 = digit[i+5]
    digit6 = digit[i+6]
    digit7 = digit[i+7]
    digit8 = digit[i+8]
    digit9 = digit[i+9]
    digit10 = digit[i+10]
    digit11 = digit[i+11]
    digit12 = digit[i+12]
    digit1m = digit[i-1]
    digit2m = digit[i-2]
    digit3m = digit[i-3]
    digit4m = digit[i-4]
    digit5m = digit[i-5]
    digit6m = digit[i-6]
    digit7m = digit[i-7]
    digit8m = digit[i-8]
    digit9m = digit[i-9]
    digit10m = digit[i-10]
    digit11m = digit[i-11]
    digit12m = digit[i-12]
    if digit12 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit6 * digit7 * digit8 * digit9 * digit10 * digit11 * digit12, i]
    elsif digit12.nil? && digit11 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit6 * digit7 * digit8 * digit9 * digit10 * digit11 * digit1m, i]
    elsif digit11.nil? && digit10 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit6 * digit7 * digit8 * digit9 * digit10 * digit2m * digit1m, i]
    elsif digit10.nil? && digit9 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit6 * digit7 * digit8 * digit9 * digit3m * digit2m * digit1m, i]
    elsif digit9.nil? && digit8 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit6 * digit7 * digit8 * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit8.nil? && digit7 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit6 * digit7 * digit5m * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit7.nil? && digit6 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit6 * digit6m * digit5m * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit6.nil? && digit5 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit5 * digit7m * digit6m * digit5m * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit5.nil? && digit4 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit4 * digit8m * digit7m * digit6m * digit5m * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit4.nil? && digit3 != nil
      product_array << [num * digit1 * digit2 * digit3 * digit9m * digit8m * digit7m * digit6m * digit5m * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit3.nil? && digit2 != nil
      product_array << [num * digit1 * digit2 * digit10m * digit9m * digit8m * digit7m * digit6m * digit5m * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit2.nil? && digit1 != nil
      product_array << [num * digit1 * digit11m * digit10m * digit9m * digit8m * digit7m * digit6m * digit5m * digit4m * digit3m * digit2m * digit1m, i]
    elsif digit1.nil?
      product_array << [num * digit1m * digit2m * digit3m * digit4m * digit5m * digit6m * digit7m * digit8m * digit9m * digit10m * digit11m * digit12m, i]

    else
      p "this error is impossible"
    end
  end
    answer_array = product_array.sort.last
    answer_index = answer_array[1]
    if answer_index <= 987
      puts "#{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}, #{digit[answer_index+6]}, #{digit[answer_index+7]}, #{digit[answer_index+8]}, #{digit[answer_index+9]}, #{digit[answer_index+10]}, #{digit[answer_index+11]}, #{digit[answer_index+12]}"
    elsif answer_index == 988
      puts "#{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}, #{digit[answer_index+6]}, #{digit[answer_index+7]}, #{digit[answer_index+8]}, #{digit[answer_index+9]}, #{digit[answer_index+10]}, #{digit[answer_index+11]}"
    elsif answer_index == 989
      puts "#{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}, #{digit[answer_index+6]}, #{digit[answer_index+7]}, #{digit[answer_index+8]}, #{digit[answer_index+9]}, #{digit[answer_index+10]}"
    elsif answer_index == 990
      puts "#{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}, #{digit[answer_index+6]}, #{digit[answer_index+7]}, #{digit[answer_index+8]}, #{digit[answer_index+9]}"
    elsif answer_index == 991
      puts "#{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}, #{digit[answer_index+6]}, #{digit[answer_index+7]}, #{digit[answer_index+8]}"
    elsif answer_index == 992
      puts "#{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}, #{digit[answer_index+6]}, #{digit[answer_index+7]}"
    elsif answer_index == 993
      puts "#{digit[answer_index-6]}, #{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}, #{digit[answer_index+6]}"
    elsif answer_index == 994
      puts "#{digit[answer_index-7]}, #{digit[answer_index-6]}, #{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}, #{digit[answer_index+5]}"
    elsif answer_index == 995
      puts "#{digit[answer_index-8]}, #{digit[answer_index-7]}, #{digit[answer_index-6]}, #{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}#{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}, #{digit[answer_index+4]}"
    elsif answer_index == 996
      puts "#{digit[answer_index-9]}, #{digit[answer_index-8]}, #{digit[answer_index-7]}, #{digit[answer_index-6]}, #{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}, #{digit[answer_index+3]}"
    elsif answer_index == 997
      puts "#{digit[answer_index-10]}, #{digit[answer_index-9]}, #{digit[answer_index-8]}, #{digit[answer_index-7]}, #{digit[answer_index-6]}, #{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}, #{digit[answer_index+2]}"
    elsif answer_index == 998
      puts "#{digit[answer_index-11]}, #{digit[answer_index-10]}, #{digit[answer_index-9]}, #{digit[answer_index-8]}, #{digit[answer_index-7]}, #{digit[answer_index-6]}, #{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}, #{digit[answer_index+1]}"
    elsif answer_index == 999
      puts "#{digit[answer_index-12]}, #{digit[answer_index-11]}, #{digit[answer_index-10]}, #{digit[answer_index-9]}, #{digit[answer_index-8]}, #{digit[answer_index-7]}, #{digit[answer_index-6]}, #{digit[answer_index-5]}, #{digit[answer_index-4]}, #{digit[answer_index-3]}, #{digit[answer_index-2]}, #{digit[answer_index-1]}, #{digit[answer_index]}"
    else
      "something went wrong"
    end
    puts answer_array[0]
end



