# Represents a computer Crazy Eights player.
class AIPlayer
  attr_accessor :cards

  # Creates a new player and deals them a hand of eight cards.
  def self.deal_player_in(deck)
    self.new(deck.take(8))
  end

  def initialize(cards)
    @cards = cards
  end

  # Returns the suit the player has the most of; this is the suit to
  # switch to if player gains control via eight.
  def favorite_suit
    nums = Hash.new(0)
    cards.each do |card|
      nums[card.suit] += 1
    end
    nums.key(nums.values.max)
  end

  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    raise "cannot play card outside your hand" unless cards.include?(card)
    if card.value != :eight
      pile.play(card)
    else
      pile.play_eight(card, self.favorite_suit)
    end
    self.cards.delete(card)
  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    self.cards += deck.take(1)
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    valid_non_eights = cards.select do |card|
      card.value != :eight && pile.valid_play?(card)
    end
    valid_eights = cards.select do |card|
      card.value == :eight && pile.valid_play?(card)
    end
    if valid_non_eights.length > 0
      return valid_non_eights[rand(valid_non_eights.length)]
    elsif valid_eights.length > 0
      return valid_eights[rand(valid_eights.length)]
    end
    nil
  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again. If deck is empty, pass.
  def play_turn(pile, deck)
    until self.choose_card(pile) || deck.empty?
      # begin
        self.draw_from(deck)
      # rescue StandardError
        # return nil
      # end
    end
    play_card(pile, self.choose_card(pile)) if self.choose_card(pile)
  end
end
