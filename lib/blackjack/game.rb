module Blackjack

  class Game
    attr_accessor :shoe, :players, :dealer 
    def initialize
      @players = [Player.new(self, 'Able'), Player.new(self, 'Baker'),
                  Player.new(self, 'Charlie'), Player.new(self, 'Dog')]
      @shoe = StandardDeck.new
      @dealer = Dealer.new(self)
      #self.begin_round
    end

    def begin_round
      @players.each do |player|
        player.hands[0] = Hand.new(@shoe.deal, @shoe.deal)
      end
      2.times { @dealer.hit }
    end
        
    
    
  end
  
  class Player
    attr_accessor :bankroll, :name, :bet_size, :hands
    def initialize(game, name = "Player")
      @hands = []
      @hands[0] = Hand.new
      @bankroll = 0
      @name = name
      @game = game
      @bet_size = 1
    end

    def hit(hand = 0)
      @hands[hand].cards << @game.shoe.deal
    end
  end 

  class Dealer
    attr_accessor :hand
    def initialize(game)
      @game = game
      @hand = Hand.new
    end

    def hit
      @hand.cards << @game.shoe.deal
    end
    
    def evaluate
      dealer_done=false
      until dealer_done do
        if @hand.score <= 16
          self.hit
        elsif @hand.score > 17
          dealer_done = true
        elsif @hand.score == 17 and @hand.soft?
          self.hit
        end
        if @hand.bust?
          dealer_done = true
        end
      end
    end

  end
  

  

  def player_decisions(player)
    #offer hit, stand options
    #assume stand for testing
  end



end

  
  
