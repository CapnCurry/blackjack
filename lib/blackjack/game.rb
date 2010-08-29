module Blackjack

  class Game
    attr_accessor :shoe, :players, :dealer 
    def initialize
      @players = [Player.new(self, 'Able'), Player.new(self, 'Baker'),
                  Player.new(self, 'Charlie'), Player.new(self, 'Dog')]
      @shoe = StandardDeck.new
      @shoe.shuffle!
      @dealer = Dealer.new(self)
    end

    def begin_round
      @players.each do |player|
        player.hands[0] = Hand.new(@shoe.deal, @shoe.deal)
        player.bankroll -= player.bet_size
      end
      @dealer.hand = Hand.new(@shoe.deal, @shoe.deal)
    end

    def play
      self.begin_round
      @players.each { |player| player.play_hand }
      @dealer.play_hand
      self.payout
    end
    
    def payout
      @players.each do |player|
        player.hands.each do |hand|
          if hand > dealer.hand
            player.bankroll += player.bet_size * 2
            player.bankroll += (player.bet_size * 0.5) if hand.blackjack?
          elsif hand == dealer.hand
            player.bankroll += player.bet_size
          else
            #Nothing happens. You lose!
          end
          
        end
      end
    end

  end
  
  class Player

    attr_accessor :bankroll, :name, :bet_size, :hands
    def initialize(game, name = "Player")
      @hands = []
      @hands[0] = Hand.new
      @bankroll = 500
      @name = name
      @game = game
      @bet_size = 100
    end

    def hit(hand = 0)
      @hands[hand].cards << @game.shoe.deal
    end

    def play_hand
      #Report current score
      #Offer Stand, Hit, Double, Split options
      #Instant win on blackjack
      #Instant lose on bust
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
    
    def play_hand
      dealer_done=false
      until dealer_done do
        self.hit if @hand.score <= 16
        #self.hit if (@hand.score == 17 and (@hand.soft? == true))           
        dealer_done = true if (@hand.score == 17 and (@hand.soft? == false))
        dealer_done = true if @hand.score >= 18
      end
    end
    
  end
  
  
  
end



