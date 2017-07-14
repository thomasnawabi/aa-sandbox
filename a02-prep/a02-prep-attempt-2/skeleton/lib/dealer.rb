require_relative 'player'

class Dealer < Player
  attr_accessor :bets

  def initialize
    super("dealer", 0)

    @bets = Hash.new(0)
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    until self.hand.points >= 17
      self.hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    self.bets[player] += amt
  end

  def pay_bets
    bets.each do |player, bet|
      if player.hand.beats?(self.hand)
        player.pay_winnings(bet * 2)
      end
    end
  end
end
