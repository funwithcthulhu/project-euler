# Card class for 054 Poker Hands
class Card
  include Comparable
  attr_accessor :value
  attr_reader :suit

  Faces =
    {
      'A' => 1,
      'T' => 10,
      'J' => 11,
      'Q' => 12,
      'K' => 13
    }.freeze

  def initialize(value)
    @value = value.split(//)[0].gsub(/[ATJQK]/, Faces).to_i
    @suit = value.split(//)[1]
  end

  def <=>(other)
    value <=> other.value
  end
end
