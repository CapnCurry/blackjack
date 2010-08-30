module Blackjack

  class Deck
    
    class EmptyDeckError < ::ArgumentError; end

    attr_accessor :cards
    
    def initialize(decks = 1, typecode = 'P')
      @cards = []
      case typecode
      when 'P' then decks.times { @cards = @cards + build_poker }
      when 'S' then decks.times { @cards = @cards + build_spanish}
      end
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

    def build_poker
      cardpack = []
       [:ace, :deuce, :three, :four, :five, :six,
       :seven, :eight, :nine, :ten, :jack, :queen, :king].each do |face|
                [:hearts, :clubs, :spades, :diamonds].each do |suit|
          cardpack << Card.new(suit, face)
        end
      end
      return cardpack
    end
  

    def build_spanish
      cardpack = []
       [:ace, :deuce, :three, :four, :five, :six,
       :seven, :eight, :nine, :jack, :queen, :king].each do |face|
        [:hearts, :clubs, :spades, :diamonds].each do |suit|
          cardpack << Card.new(suit, face)
        end
      end
      return cardpack
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
