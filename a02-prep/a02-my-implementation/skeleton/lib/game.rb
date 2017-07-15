require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class Game

  attr_reader :deck, :player1, :player2
  attr_accessor :discard_pile

  def initialize(player1, player2, deck = Deck.new.shuffle!)
  end



end
