module Blackjack

  class Deck
    class EmptyDeckError < ::ArgumentError; end

    def self.eight
      of(8)
    end
    
    def self.of(number = 1)
      cards = []
      number.times do
        cards.push(*new.cards)
      end
      Deck.new(cards)
    end
    
    attr_accessor :cards
    def initialize(cards = [])
      @cards = cards
      build!
    end

    def deal
      if @cards.empty?
        raise EmptyDeckError, "All cards dealt"
      else
        @cards.pop
      end 
    end

    def shuffle!
      @cards.shuffle!
    end

    def size
      @cards.size
    end

    private

    # Abstract; define in child classes
    def build!
    end

  end
  
  class StandardDeck < Deck

    private

    def build!
      2.upto(14) do |n|
        1.upto(4) do |s|
          @cards << Card.new(Card::SUITS[s], Card::NAMES[n])
        end
      end
    end
    
  end

  class InfiniteDeck < Deck

    def size
      1/0.0
    end
    
  end

end
