class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    non_aces = cards.select { |card| card.value != :ace }
    aces = cards.select { |card| card.value == :ace }
    sum = 0
    non_aces.each { |card| sum += card.blackjack_value }
    if sum + aces.length * 11 < 22
      sum += aces.length * 11
    else
      sum += aces.length
    end
    sum
  end

  def busted?
    self.points > 21
  end

  def hit(deck)
    raise "already busted" if self.busted?
    self.cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?

    (other_hand.busted?) || (self.points > other_hand.points)
  end

  def return_cards(deck)
    deck.return(self.cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
