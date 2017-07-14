class Player
  attr_reader :name
  attr_accessor :hand, :bankroll

  def initialize(name, bankroll)
    @name, @bankroll = name, bankroll
    @hand = nil
  end

  def pay_winnings(bet_amt)
    self.bankroll += bet_amt
  end

  def return_cards(deck)
    hand.return_cards(deck)
    self.hand = nil
  end

  def place_bet(dealer, bet_amt)
    raise "player can't cover bet" if bet_amt > bankroll
    dealer.take_bet(self, bet_amt)
    self.bankroll -= bet_amt
  end
end
