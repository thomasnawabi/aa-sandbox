class Hand

  def self.deal_from(deck)
    Hand.new(deck.take(8))
  end

  attr_accessor :cards

  def initialize(cards = self.class.deal_from(deck))
    @cards = cards
  end

  def playable_cards(top)
    cards.select do |card|
      card.suit == top.suit || card.value == top.value || card.value == :eight 
    end
  end

  def points
    sum = 0
    @cards.each { |card| sum += card.crazy_eights_value }
    sum
  end

  def return_cards(deck)
    deck.return(cards)
    @cards = []
  end

  def hit(deck)
    @cards += deck.take(1)
  end

  def remove(card)
    @cards.delete(card)
  end

end
