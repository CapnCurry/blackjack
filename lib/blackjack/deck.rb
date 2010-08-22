module Blackjack

  class Deck

    class EmptyDeckError < ::ArgumentError; end
    
    attr_accessor :cards
    def initialize
      @cards = []
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

    private

    def build!
      2.upto(14) do |n|
        1.upto(4) do |s|
          @cards << Card.new(Card::SUITS[s], Card::NAMES[n])
        end
      end
    end
    
  end

end
