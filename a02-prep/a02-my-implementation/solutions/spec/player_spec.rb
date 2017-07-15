require 'player'
require 'card'

describe Player do
  subject(:player) do
    Player.new("Nick the Greek")
  end

  it "assigns the name" do
    expect(player.name).to eq("Nick the Greek")
  end

  it "initializes a score of 0" do
    expect(player.score).to eq(0)
  end

  it "initializes a hand of nil" do
    expect(player.hand).to eq(nil)
  end

  describe "#call_suit" do

    it "returns a suit" do
      suits = [:clubs, :diamonds, :hearts, :spades]
      expect(suits).to include(player.call_suit)
    end

  end

  describe "#call_suit" do

    it "returns a suit" do
      suits = [:clubs, :diamonds, :hearts, :spades]
      expect(suits).to include(player.call_suit)
    end

  end

  describe "#make_play" do

    it "returns a card if hand contains a playable card and removes it" do
      hand = double("hand")
      deck = double("deck")
      cards = [Card.new(:hearts, :ace), Card.new(:spades, :three)]
      top_card = Card.new(:hearts, :three)
      expect(hand).to receive(:playable_cards)
                                      .with(top_card).twice.and_return(cards)
      player.hand = hand
      expect(hand).to receive(:remove)
      expect(cards).to include(player.make_play(deck, top_card))
    end

    it "calls Hand#hit if hand doesn't contain a playable card" do
      hand = double("hand")
      deck = double("deck")
      cards = [Card.new(:hearts, :ace), Card.new(:spades, :three)]
      top_card = Card.new(:hearts, :three)
      expect(hand).to receive(:playable_cards).with(top_card).and_return([])
      expect(hand).to receive(:playable_cards).with(top_card).twice.and_return(cards)
      player.hand = hand
      expect(hand).to receive(:remove)
      expect(hand).to receive(:hit).with(deck)
      player.make_play(deck, top_card)
    end
  end
  #
  # describe "#return_cards" do
  #   let(:deck) { double("deck") }
  #   let(:hand) { double("hand", :return_cards => nil) }
  #
  #   before(:each) { player.hand = hand }
  #
  #   it "returns player's cards to the deck" do
  #     expect(hand).to receive(:return_cards).with(deck)
  #     player.return_cards(deck)
  #   end
  #
  #   it "resets hand to nil" do
  #     player.return_cards(deck)
  #     expect(player.hand).to be_nil
  #   end
  # end
  #
  # describe "#place_bet" do
  #   let(:dealer) { double("dealer", :take_bet => nil) }
  #
  #   it "registers bet with dealer" do
  #     expect(dealer).to receive(:take_bet).with(player, 10_000)
  #     player.place_bet(dealer, 10_000)
  #   end
  #
  #   it "deducts bet from bankroll" do
  #     player.place_bet(dealer, 10_000)
  #     expect(player.bankroll).to eq(190_000)
  #   end
  #
  #   it "enforces limits" do
  #     expect do
  #       player.place_bet(dealer, 1_000_000)
  #     end.to raise_error("player can't cover bet")
  #   end
  # end
end
