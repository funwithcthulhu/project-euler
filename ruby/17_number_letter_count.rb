# Main converter methods for Float class
module IntConverter
  def to_words
    num = self
    convert(num)
  end

  def convert(int)
    return '' if int.zero?
    DICT.each do |i, words|
      return words.to_s if int.to_s.length == 1 && int / i > 0
      if int < 100 && int / i > 0
        return words.to_s if (int % i).zero?
        return "#{words} " + (int % i).to_words
      elsif int / i > 0
        if !(int % i).zero?
          return (int / i).to_words + " #{words} and " + (int % i).to_words
        else
          return (int / i).to_words + " #{words}" + (int % i).to_words
        end
      end
    end
  end

  DICT =
    {
      1000 => 'thousand',
      100 => 'hundred',
      90 => 'ninety',
      80 => 'eighty',
      70 => 'seventy',
      60 => 'sixty',
      50 => 'fifty',
      40 => 'forty',
      30 => 'thirty',
      20 => 'twenty',
      19 => 'nineteen',
      18 => 'eighteen',
      17 => 'seventeen',
      16 => 'sixteen',
      15 => 'fifteen',
      14 => 'fourteen',
      13 => 'thirteen',
      12 => 'twelve',
      11 => 'eleven',
      10 => 'ten',
      9 => 'nine',
      8 => 'eight',
      7 => 'seven',
      6 => 'six',
      5 => 'five',
      4 => 'four',
      3 => 'three',
      2 => 'two',
      1 => 'one'
    }.freeze
end

# Including the appropriate modules in class Integer
class Integer
  include IntConverter
end

def count(n)
  sum = 0
  1.upto(n).each do |number|
    sum += number.to_words.split(/\s+/).join.split(//).size
  end
  sum
end