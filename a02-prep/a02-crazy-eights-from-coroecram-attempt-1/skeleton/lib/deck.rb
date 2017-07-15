require_relative 'card'

# Represents a deck of playing cards.
class Deck

  attr_accessor :discard_pile

  # Returns an array of all 52 playing cards.
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
    @discard_pile = []
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  def shuffle
    @cards.shuffle
  end

  def last_discarded
    discard_pile.last
  end

  # Takes a card from the top of the deck, returns a card.
  def draw
    raise "not enough cards" if @cards.empty?
    @cards.shift
  end

  # Allow players to place cards on the discard pile
  def discard(card)
    discard_pile << card
  end

  def reshuffle_discards
  end

  # puts top card of the deck in the discard pile
  def show_top_card
    self.discard(draw)
  end

  def top_card
  end


end
