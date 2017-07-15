require 'card'
require 'hand'

describe Hand do

  let(:deck_cards) {
    [
      Card.new(:spades, :deuce),
      Card.new(:spades, :three),
      Card.new(:spades, :ace),
      Card.new(:spades, :jack),
      Card.new(:diamonds, :deuce),
      Card.new(:clubs, :four),
      Card.new(:clubs, :ace),
      Card.new(:diamonds, :jack)
    ]
  }

  describe "::deal_from" do
    it "deals a hand of eight cards" do

      deck = double("deck")
      expect(deck).to receive(:take).with(8).and_return(deck_cards)

      hand = Hand.deal_from(deck)

      expect(hand.cards).to match_array(deck_cards)
    end
  end

  describe "#playable_cards" do

    it "returns playable cards when there are playable cards" do

      deck = double("deck")
      expect(deck).to receive(:take).with(8).and_return(deck_cards)

      hand = Hand.deal_from(deck)

      top_card = Card.new(:spades, :four)
      playable_cards =
       [
          Card.new(:clubs, :four),
          Card.new(:spades, :deuce),
          Card.new(:spades, :three),
          Card.new(:spades, :jack),
          Card.new(:spades, :ace)
        ]
      expect(hand.playable_cards(top_card)).to match_array(playable_cards)
    end

    it "returns empty array when there aren't" do
      deck = double("deck")
      expect(deck).to receive(:take).with(8).and_return(deck_cards)

      hand = Hand.deal_from(deck)

      top_card = Card.new(:hearts, :king)
      expect(hand.playable_cards(top_card)).to eq([])
    end

    it "returns array including eight-card when hand includes one" do
      deck_cards_w_eight =
        [
          Card.new(:spades, :deuce),
          Card.new(:spades, :three),
          Card.new(:spades, :ace),
          Card.new(:spades, :jack),
          Card.new(:diamonds, :deuce),
          Card.new(:clubs, :four),
          Card.new(:clubs, :ace),
          Card.new(:diamonds, :eight)
        ]
      playable_cards =
        [
          Card.new(:clubs, :four),
          Card.new(:spades, :deuce),
          Card.new(:spades, :three),
          Card.new(:spades, :jack),
          Card.new(:spades, :ace),
          Card.new(:diamonds, :eight)
        ]
      deck = double("deck")
      expect(deck).to receive(:take).with(8).and_return(deck_cards_w_eight)

      hand = Hand.deal_from(deck)

      top_card = Card.new(:spades, :four)
      expect(hand.playable_cards(top_card)).to match_array(playable_cards)
    end

  end

  describe "#points" do
    it "returns the total points of the hand when there are cards left"  do
      deck = double("deck")
      expect(deck).to receive(:take).with(8).and_return(deck_cards)
      hand = Hand.deal_from(deck)
      expect(hand.points).to eq(33)
    end

    it "returns 0 when there are no cards left"  do
      hand = Hand.new([])
      expect(hand.points).to eq(0)
    end
  end

  describe "#return_cards" do
    let(:deck) { double("deck") }
    let(:hand) do
      Hand.new([Card.new(:spades, :deuce), Card.new(:spades, :three)])
    end

    it "returns cards to deck" do
      expect(deck).to receive(:return) do |cards|
        expect(cards.count).to eq(2)
      end

      hand.return_cards(deck)
    end

    it "removes card from hand" do
      allow(deck).to receive(:return)

      hand.return_cards(deck)
      expect(hand.cards).to eq([])
    end
  end

  describe "#hit" do

    it "draws a card from deck" do
      deck = double("deck")
      card = double("card")
      expect(deck).to receive(:take).with(1).and_return([card])

      hand = Hand.new([])
      hand.hit(deck)

      expect(hand.cards).to include(card)
    end

  end

  describe "#remove" do

    it "removes card from the hand" do
      deck = double("deck")
      card = deck_cards[0]
      expect(deck).to receive(:take).with(8).and_return(deck_cards)

      hand = Hand.deal_from(deck)
      hand.remove(card)

      expect(hand.cards).not_to include(card)
    end

  end

end
