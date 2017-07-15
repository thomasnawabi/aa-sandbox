require 'game'
require 'card'
require 'deck'
require 'player'

describe Game do

  let(:player1) { Player.new("player1") }
  let(:player2) { Player.new("player2") }
  subject(:game) { Game.new(player1, player2) }

  it "initializes with a card on the discard pile" do
    expect(game.discard_pile.length).not_to be(0)
  end

end
