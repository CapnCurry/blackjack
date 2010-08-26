module Blackjack
  
  class Hand
    attr_accessor :cards
    
    def initialize(*cards)
      @cards = cards
    end

    # Add a hard to the hand
    def hit(card)
      @cards << card
    end

    # Calculate the best score for the hand
    def score
      handscore = possible_scores.sort.reverse
      handscore.detect { |value| value <= 21 } or handscore.last
    end

    # Check hand for bust scenario
    def bust?
      current_score = score
      if current_score > 21
        true
      elsif current_score > 0
        false
      else
        raise "Invalid Score"
      end
    end

    private

    # Find the current card values
    def card_values
      @cards.map(&:value)
    end

    # Determine all possible scores for this hand
    def possible_scores
      card_values.inject([0]) do |memo, item|
        if ace_value?(item)
          added_one = memo.map { |score| score + 1 }
          added_one << (added_one.last + 10)
        else
          memo.map { |number| number + item.first }
        end
      end
    end

    # Check a card value to see if it looks like an ace
    def ace_value?(value)
      value.size == 2
    end
    
  end
end
