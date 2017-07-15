require 'colorize'
#comment in for fun colors!

# -*- coding: utf-8 -*-

# Represents a playing card.
class Card

  # Returns an array of all suits.
  def self.suits
  end

  # Returns an array of all values.
  def self.values
  end

  attr_reader :suit, :value

  def initialize
  end

  #this should be pretty self explanatory.
  def same_suit?
  end

  #yep.
  def same_value?
  end

  def crazy?
  end

  def string_value
  end

  # def value_int(card)
  #   VALUE_NUMBERS[card.value]
  # end

  #if card can be played on top of the previous card in the discard pile
  def valid_match?
  end

  # def valid_place?(top_of_pile, card)
  #   (card.same_suit?(top_of_pile) && value_int(card) < value_int(top_of_pile))
  # end

  # def to_s
  #   if suit == :hearts || suit == :diamonds
  #     "| ".colorize(:color => :black, :background => :white) + (VALUE_STRINGS[value] + SUIT_STRINGS[suit]).colorize(:color => :red, :background => :white) + " |".colorize(:color => :black, :background => :white) + " "
  #   else
  #     "| ".colorize(:color => :black, :background => :white) + (VALUE_STRINGS[value] + SUIT_STRINGS[suit]).colorize(:color => :black, :background => :white) + " |".colorize(:color => :black, :background => :white) + " "
  #   end
  # end
end
