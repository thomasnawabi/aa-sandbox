require_relative 'player'



class Dealer < Player

  attr_accessor :bets, :hand

  def initialize
    super("dealer", 0)
    @hand = nil
    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    until hand.busted? || (hand.points >= 17)
      self.hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, amt|
      player.pay_winnings(2 * amt) if player.hand.beats?(self.hand)
    end

    nil
  end
end
