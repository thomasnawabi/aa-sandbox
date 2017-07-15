require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class Game

  attr_reader :deck, :player1, :player2
  attr_accessor :discard_pile

  def initialize(player1, player2, deck = Deck.new.shuffle!)
    @deck = deck, @player1 = player1, @player2 = player2
    @discard_pile = [@deck.take(1)]
    @player1.hand = Hand.deal_from(deck)
    @player2.hand = Hand.deal_from(deck)
  end



end
