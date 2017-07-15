require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def all_cards
    all_cards = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(value, suit)
      end
    end

    all_cards
  end

  def initalize(cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @card.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if count < n
    @cards.take(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards + cards
  end
end
