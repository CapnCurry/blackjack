module Blackjack
  
  class Hand
    include Comparable
    attr_accessor :cards

    def to_s
      tempstr = ""
      @cards.each do |card|
        tempstr = tempstr + card.to_s + ", "
      end
      tempstr = tempstr + "for a score of " + self.score.to_s
    end
    
      #result = @cards.inject {|memo, card| memo } # + ", "} #+ card.to_s }
      #return result #+ "\nFor a score of " + self.score.to_s
      # end
    
    
    def blackjack?
      if self.score == 21 and self.cards.size == 2                             
        true
      else
        false
      end
    end

    def splittable?
      if self.cards.size == 2 and self.cards[0].value == self.cards[1].value
        true
      else
        false
      end
    end
    
    def doubleable?
      if self.cards.size == 2 and (self.score == 10 or self.score == 11)
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
    
    # Calculate the best score for the hand
    def score
      handscore = possible_scores.sort.reverse
      handscore.detect { |value| value <= 21 } or handscore.last
    end

    def soft?
      hypothetical_hand = Hand.new
      hypothetical_hand.cards = @cards.clone
      hypothetical_hand.cards << Card.new(:jackasses, :ten)
      return false if hypothetical_hand.bust? or self.score <= 10
      return true
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
