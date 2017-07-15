# Represents the common "pile" of cards on which to play Crazy Eights.
class Pile

  attr_accessor :top_card, :eight_played, :picked_suit

  def initialize(top_card)
    @top_card = top_card
    @eight_played = false
    @picked_suit = nil
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
    eight_played ? picked_suit : top_card.suit
  end

  # Returns true if a card is valid to play in this circumstance. Card
  # should either:
  #   (1) be the same suit as the current suit,
  #   (2) be the same rank as the previous card,
  #   (3) be an eight.
  def valid_play?(card)
    card.value == current_value || card.suit == current_suit || card.value == :eight
  end

  # Plays a non-eight card on the top of the pile, objecting if it is
  # not valid.
  def play(played_card)
    raise "invalid play" unless self.valid_play?(played_card)
    raise "must declare suit when playing eight" if played_card.value == :eight
    self.top_card = played_card
    self.picked_suit = played_card.suit
  end

  # Plays an eight on top of the pile, setting the suit choice.
  def play_eight(played_card, suit)
    raise "must play eight" unless played_card.value == :eight
    self.top_card = played_card
    self.eight_played = true
    self.picked_suit = suit
  end
end
