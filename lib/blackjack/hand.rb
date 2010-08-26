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
    
    def ==(other_hand)
      #true if self.blackjack? and other_hand.blackjack?
      #true if self.score == other_hand.score
      #true if self.bust? and other_hand.bust?
      if self.blackjack? and other_hand.blackjack?
        true
      elsif self.bust? and other_hand.bust?
        true
      elsif self.score == other_hand.score and
          self.blackjack? == other_hand.blackjack?
        true
      else
        false
      end
    end
    
      
    def > (other_hand)
      if self.blackjack? and not other_hand.blackjack?
        true
      elsif self.score > other_hand.score and not self.bust?
        true
      elsif other_hand.bust? and not self.bust?
        true
      else
        false
      end
    end
    
    def <(other_hand)
      if other_hand.blackjack? and not self.blackjack?
        true
      elsif other_hand.score > self.score and not other_hand.bust?
        true
      elsif self.bust? and not other_hand.bust?
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
