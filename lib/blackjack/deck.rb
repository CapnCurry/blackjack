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
      [:ace, :deuce, :three, :four, :five, :six,
       :seven, :eight, :nine, :ten, :jack, :queen, :king].each do |face|
        [:hearts, :clubs, :spades, :diamonds].each do |suit|
          @cards << Card.new(suit, face)
        end
      end
    end
  end

  class SpanishDeck < Deck
    private
    def build!
      [:ace, :deuce, :three, :four, :five, :six,
       :seven, :eight, :nine, :jack, :queen, :king].each do |face|
        [:hearts, :clubs, :spades, :diamonds].each do |suit|
          @cards << Card.new(suit, face)
        end
      end
    end
  end    
      
  class InfiniteDeck < Deck

    def size
      1/0.0 #It just goes on forever!
    end
    
    def deal
      return Card.new([:clubs, :hearts, :diamonds, :spades].shuffle.pop,
                      [:ace, :deuce, :three, :four, :five, :six, :seven, :eight,
                       :nine, :ten, :jack, :queen, :king, :ace].shuffle.pop)
    end
  end
end
