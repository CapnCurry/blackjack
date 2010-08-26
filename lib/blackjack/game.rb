module Blackjack

  class Game
    attr_accessor :shoe, :players, :dealer 
    def initialize
      @players = [Player.new(self), Player.new(self),
                  Player.new(self), Player.new(self)]
      @shoe = StandardDeck.new
      @dealer = Dealer.new(self)
    end

    def begin_round
      @players.each do |player|
        player.hands[0] = Hand.new
        player.hands[0].hit @shoe.deal
        player.hands[0].hit @shoe.deal
      end
      @dealer.hand.hit @shoe.deal
      @dealer.hand.hit @shoe.deal
    end
  end
  
  class Player
    attr_accessor :bankroll, :name, :bet_size, :hands
    def initialize(game)
      @hands = []
      @bankroll = 0
      @name = 'Mario'
      @bet_size = 1
      @game = game
    end
  end 

  class Dealer
    attr_accessor :hand
    def initialize(game)
      @hand = Hand.new
      @game = game
    end
    
    def evaluate
      dealer_done=false
      until dealer_done do
        if @hand.score <= 16
          @hand.hit @game.shoe.deal
        elsif @hand.score > 17
          dealer_done = true
        elsif @hand.score == 17 and @hand.soft?
          @hand.hit @game.shoe.deal
        end
        if @hand.bust?
          dealer_done = true
        end
      end
    end

  end
  

  def play_game(game)
    game = Game.new
    game.begin_round
    #if game.dealer.insurance?
    #if game.dealer.stealth_blackjack?
    players.each do |player|
      player_decisions(player)
    end
    dealer.evaluate
    game.payout
  end

  def player_decisions(player)
    #offer hit, stand options
    #assume stand for testing
  end



end

  
  
