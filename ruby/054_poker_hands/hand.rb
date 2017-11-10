require_relative 'card.rb'

# Creates a Poker Hand object with 5 card objects
class Hand
  include Comparable
  include Enumerable
  attr_reader :hand, :score, :highest

  def initialize(cards)
    @hand = cards.split(/\s+/).map { |card| Card.new(card) }
    @highest = @hand.max
    @score = 0
    score_me
  end

  def <=>(other)
    self.score <=> other.score
  end

  def higher?(other)
    a = self.hand.dup.sort
    a.each_index do |i|
      a[i].value = 14 if a[i].value == 1
    end
    b = other.hand.dup.sort
    b.each_index do |i|
      b[i].value = 14 if b[i].value == 1
    end
    rec_higher?(a, b)
  end

  private

  def rec_higher?(a, b)
    if a.last > b.last
      return true
    elsif a.last < b.last
      return false
    else
      a.pop
      b.pop
      rec_higher?(a, b)
    end
  end

  def score_me
    matches
    @score += 70 if straight?  
    @score += 80 if flush?
    @score += 100 if royal? && flush?
  end

  def matches
    private_score = 0
    w = @hand.dup
    w.each_index do |i|
      w[i].value = 14 if w[i].value == 1
    end
    pairs = 0
    triples = 0
    w.group_by(&:value).each_pair do |face, num|
      if num.size == 2
        pairs += 1
        private_score += face
      elsif num.size == 3
        triples += 1
        private_score += face
        private_score += 44
      elsif num.size == 4
        private_score += face
        private_score += 129
      end
    end
    private_score += 15 if pairs == 2
    private_score += 40 if pairs == 1 && triples == 1
    @score += private_score
  end

  def straight?
    @hand.sort.each_cons(2).all? { |x, y| y.value == x.value + 1 }
  end

  def flush?
    @hand.each_cons(2).all? { |card1, card2| card1.suit == card2.suit }
  end

  def royal?
    royals = [1, 10, 11, 12, 13]
    @hand.sort.each_index do |card|
      return false unless @hand[card].value == royals[card]
    end
    true
  end
end
