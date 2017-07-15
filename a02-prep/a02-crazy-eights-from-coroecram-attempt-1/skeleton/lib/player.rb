require_relative 'UI'
require_relative 'card'
require 'byebug'

class Player

  attr_reader :name
  attr_accessor :hand

  def initialize(name, hand = [])
    @name, @hand = name, hand
  end

  def hand_size
    hand.count
  end

  def draw(deck)
    self.hand << deck.draw
  end

  def show_hand
  end

  def draw_check
  end

  #in this version, you can only draw if you have no valid cards to play.
  def get_cards(deck)
    until valid_card?(deck)
      self.draw(deck)
    end
  end

  def valid_card?(deck)
    hand.any? do |card|
      card.valid_match?(deck.last_discarded)
    end
  end

  def has_play?
  end

  def play_card(deck)
  end

  def crazy_eights
  end



  def available_suits
  end

  def suit_pick
  end

end
