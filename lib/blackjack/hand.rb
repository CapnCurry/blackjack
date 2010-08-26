module Blackjack
  
  class Hand
    include Comparable
    attr_accessor :cards

    def blackjack?
      if self.score == 21 and self.cards.size == 2
        true
      else
        false
      end
    end
    
    
    def initialize(*cards)
      @cards = cards
    end
    
    def <=> (other_hand)
      if better_than?(other_hand)
        1
      elsif push?(other_hand)
        0
      elsif worse_than?(other_hand)
        -1
      end
    end
    
    # Add a card to the hand
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

    def push?(other_hand)
      [(self.blackjack? and other_hand.blackjack?),
       (self.bust? and other_hand.bust?),
       (self.score == other_hand.score and self.blackjack? == other_hand.blackjack?)].any?
    end

    def better_than?(other_hand)
      [(self.blackjack? and not other_hand.blackjack?),
       (self.score > other_hand.score and not self.bust?),
       (other_hand.bust? and not self.bust?)].any?
    end
    
    def worse_than?(other_hand)
      [(other_hand.blackjack? and not self.blackjack?),
       (other_hand.score > self.score and not other_hand.bust?),
       (self.bust? and not other_hand.bust?)].any?
    end
           
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
