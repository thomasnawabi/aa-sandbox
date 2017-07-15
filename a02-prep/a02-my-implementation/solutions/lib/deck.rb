require_relative 'card'

class Deck

  attr_accessor :cards

  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = self.class.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def shuffle!
    new_cards = self.class.all_cards
    while new_cards == @cards
      @cards = @cards.shuffle
    end
    @cards
  end

  def take(n)
    raise "not enough cards" if n > count
    result = []
    n.times { result << @cards.shift }
    result
  end

  def return(cards)
    @cards += cards
  end

end
