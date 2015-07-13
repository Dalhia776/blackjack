require_relative 'deck'
require_relative 'card'

class Game

  attr_accessor :player, :dealer, :deck

  def initialize
    @player = []
    @dealer = []
    @deck = Deck.new
  end

  def player_hand
    self.player = deck.cards.shift(2)
    self.player.each{|cards| puts "Your cards are the #{cards.value} of #{cards.suit}."}
  end

  def dealer_hand
    self.dealer = deck.cards.shift(2)
    puts "Dealer card is the #{dealer.first.value} of #{dealer.first.suit}."
  end

  def player_total
    cards.inject(0) {|sum, card| sum += self.cards.value }
    puts "Your total score is #{player_total} with #{player.length}cards."
  end

  def dealer_total
    cards.inject(0) {|sum, card| sum += self.cards.value }
    puts "Your total score is #{dealer_total} with #{dealer.length}cards."
  end

  def player
    self.deck.shuffle!
    self.player_hand
    self.dealer_hand
    self.hit_or_bust?
    puts "Hit or stay?"
    desire = $stdin.gets.chomp.downcase
    until desire == "Stay" do
      self.player << deck.cards.shift
      self.hit_or_bust?
      puts "Hit or Stay?"
      desire = $stdin.gets.chomp.downcase
    end
    dealer_hand.each{|cards| puts "Your cards are the #{cards.value} of #{cards.suit}."}
    if dealer_total < 16
      self.dealer << deck.cards.shift
        puts "You have #{dealer_total}!"
    else dealer_total > 21
      puts "You busted!"
      self.reset
    end
  end

  def hit_or_bust?
    if player_total < 21
      puts "You have #{player_total}!"
    elsif player_total == 21
      puts "You win!"
      puts "Play again?"
      desire = $stdin.gets.chomp.downcase
      if desire == "y"
         self.reset
       end
     else player_total cards > 21
       puts "You busted!"
       puts "Play again?"
       desire = $stdin.gets.chomp.downcase
       if desire == "y"
         self.reset
       end
     end
   end

  def determine_winner(player, dealer)
    return puts "Dealer wins!" if player_total > 21
    return puts "Player wins!" if dealer_total > 21
    if player_total == dealer_total
      puts "Player wins!"
    elsif player_total > dealer_total
      puts "Player wins!"
    else
      puts "Dealer wins!"
    end
  end


  def reset
    player.cards.clear
    dealer.cards.clear
    self.deck.shuffle!
    self.play
   end
end




if ARGV[0] == "play"
  game = Game.new
  game.play
end
