require 'hand'

class Player

  attr_accessor :score, :hand
  attr_reader :name

  def initialize(name)
    @name = name
    @score = 0
    @hand = nil
  end

  def call_suit
    [:clubs, :diamonds, :hearts, :spades][rand(4)]
  end

  def make_play(deck, top_card)
    while hand.playable_cards(top_card) == []
      hand.hit(deck)
    end
    playable_cards = hand.playable_cards(top_card)
    played_card = playable_cards[rand(playable_cards.length)]
    hand.remove(played_card)
    played_card
  end

end
