# Represents the common "pile" of cards on which to play Crazy Eights.
class Pile

  attr_accessor :top_card, :eight_played, :suit_picked

  def initialize(top_card)
    @top_card = top_card
    @eight_played = false
    @suit_picked = nil
  end

  # Returns the current value in play. This is the value of the top
  # card.
  def current_value
    top_card.value
  end

  # Returns the current suit in play; either the suit of the top card,
  # or the suit specified by the previous player if an eight was
  # played.
  def current_suit
    eight_played ? suit_picked : top_card.suit
  end

  # Returns true if a card is valid to play in this circumstance. Card
  # should either:
  #   (1) be the same suit as the current suit,
  #   (2) be the same rank as the previous card,
  #   (3) be an eight.
  def valid_play?(card)
    card.value == :eight || card.value == self.current_value || card.suit == self.current_suit
  end

  # Plays a non-eight card on the top of the pile, objecting if it is
  # not valid.
  def play(card)
    raise "invalid play" unless self.valid_play?(card)
    raise "must declare suit when playing eight" if card.value == :eight
    self.top_card = card
    self.suit_picked = card.suit
  end

  # Plays an eight on top of the pile, setting the suit choice.
  def play_eight(card, suit)
    raise "must play eight" unless card.value == :eight
    self.top_card = card
    self.eight_played = true
    self.suit_picked = suit
  end


end
