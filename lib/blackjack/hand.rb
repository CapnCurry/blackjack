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
    
    
    def initialize(card1, card2)
      @cards = [card1, card2]
    end
    
    def <=> (other_hand)
      if self.blackjack? and other_hand.blackjack?
        return 0
      elsif self.bust? and other_hand.bust?
        return 0
      elsif self.score == other_hand.score and
          self.blackjack? == other_hand.blackjack?
        return 0
      end

      if self.blackjack? and not other_hand.blackjack?
        return 1
      elsif self.score > other_hand.score and not self.bust?
        return 1
      elsif other_hand.bust? and not self.bust?
        return  1
      end

      if other_hand.blackjack? and not self.blackjack?
        return -1
      elsif other_hand.score > self.score and not other_hand.bust?
        return -1
      elsif self.bust? and not other_hand.bust?
        return -1
      end
    end
    
    
    
    
    def hit(card)
      @cards << card
    end
    
    def score
      values = @cards.map {|card| card.value} 
      handscore = [0]
      values.each do |item|
        if item[1]
          handscore.map! { |number| number + item[0]}
          handscore << handscore.last + (item[1] - item[0])
        else
          handscore.map! { |number| number + item[0] }
        end
      end
      handscore = handscore.sort.reverse
      final_score = handscore.detect do |value|
        value <= 21
      end
      final_score = handscore.last if not final_score
      
      return final_score
    end
    
    
    def bust?
      if self.score > 21
        true
      elsif self.score > 0
        false
      else
        raise "Invalid Score"
      end
    end
    
    
  end
end
