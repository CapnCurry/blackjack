module Blackjack

  class Card

    VALUES = {
      :ace => [1, 11],
      :deuce => [2],
      :three => [3],
      :four => [4],
      :five => [5],
      :six => [6],
      :seven => [7],
      :eight => [8],
      :nine => [9],
      :ten => [10],
      :jack => [10],
      :queen => [10],
      :king => [10]
    }
    
    attr_accessor :suit, :face
    def initialize (suit, face)
      @suit = suit
      @face = face
    end

    def value
      @value ||= VALUES[@face]
    end

    def to_s
      "#{@face.capitalize} of #{@suit.capitalize}"
    end
    
  end

end
