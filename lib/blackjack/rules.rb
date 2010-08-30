#!/usr/bin/env ruby

module Blackjack
  
  SPANISH_GAME = ['S', 2, (2..21).to_a, 2.5, false, 7, true, false, 26, [3, 500]]
  HIGH_LIMIT = ['P', 2, [10, 11], 2.5, true, 22, true, true, 22, [500, 10000]]
  EVEN_BLACKJACK = ['P', 2, [10, 11], 2, true, 22, true, true, 22, [3, 500]]
  SIX_TO_FIVE = ['P', 2, [10, 11], 2.2, true, 22, true, true, 22, [3, 500]]
  WORST_RULES = ['P', 8, [11], 2, false, 22, false, false, 104, [3, 500]]
  BEST_RULES = ['P', 2.5, (2..21).to_a, 2.5, true, 5, true, true, 20, [3, 10000]]
  
  class Ruleset
    attr_accessor :deck_type, :deck_size, :double_on, :blackjack_pays,
                  :surrender, :charlie, :resplit_aces,
                  :double_after_split, :cut_card, :bet_limit
                  
    def initialize (deck_type = 'P', deck_size = 2, double_on = [10, 11],
                   blackjack_pays = 2.5, surrender = false,
                   charlie = 6, resplit_aces = true,
                   double_after_split = true, cut_card = 26,
                   bet_limit = [3, 500])
      
      @deck_type = deck_type
      @deck_size = deck_size
      @double_on = double_on
      @blackjack_pays = blackjack_pays
      @surrender = surrender
      @charlie = charlie
      @resplit_aces = resplit_aces
      @double_after_split = double_after_split
      @cut_card = cut_card
      @bet_limit = bet_limit
    end
  end
  
end
