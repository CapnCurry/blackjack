module Blackjack

class Table


  GT_STANDARD = { deck => 'S', deck_size => 1, double_down => [10, 11],
                  blackjack_pays => 1.5, surrender => false] }
  
  
  attr_accessor :gametype, :limits, :seats
  
  

  def play_blackjack(rules)
    table = Table.new(rules)
    game = Game.new
      end

  def initalize

  end

