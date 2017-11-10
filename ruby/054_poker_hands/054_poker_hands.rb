require_relative 'hand.rb'

player1 = 0
player2 = 0

File.open(ARGV[0]).each_line do |line|
  line_array = line.split(/\s+/)
  hand1 = Hand.new(line_array[0..4].join(' '))
  hand2 = Hand.new(line_array[5..-1].join(' '))
  if hand1 == hand2
    hand1.higher?(hand2) ? (player1 += 1) : (player2 += 1)
  elsif hand1 > hand2
    player1 += 1
  else
    player2 += 1
  end
end

puts 'player 1 wins: ' + player1.to_s
