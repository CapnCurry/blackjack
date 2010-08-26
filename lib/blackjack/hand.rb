module Blackjack
  
  class Hand
    attr_accessor :cards
    
    def initialize(card1, card2)
      @cards = [card1, card2]
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
