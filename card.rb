class Card

  attr_accessor :value, :suit


  def initialize(suit, value)
    @value = value
    @suit = suit
  end

  def value
    return 11 if @value == "A"
    return 10 if ["J", "Q", "K"].include? @value
    return @value
  end

end
