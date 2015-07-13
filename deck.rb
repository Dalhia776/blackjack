class Deck

  attr_accessor :cards

  # 1 deck in the game
  # 52 card deck
  # must have suits (ace of diamonds)
  def initialize
    @cards = []
    suits = [:hearts, :diamonds, :spades, :clubs]
    suits.each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      ["J", "Q", "K", "A"].each do |facecard|
        @cards << Card.new(suit, facecard)
    end
  end

    def shuffle!
      cards.shuffle!
    end

    def empty?
      self.cards.empty?
    end


end
