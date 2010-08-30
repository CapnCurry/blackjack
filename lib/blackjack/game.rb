module Blackjack

  class Game 
    attr_accessor :shoe, :players, :dealer 
    def initialize
      @players = [Player.new(self, 'Player 1'), Player.new(self, 'Player 2'),
                  Player.new(self, 'Player 3'), Player.new(self, 'Player 4')]
      @shoe = Deck.new
      @dealer = Dealer.new(self)
    end

    def begin_round #this needs to be broken out differently
      @players.each do |player|
        player.hands[0] = Hand.new(@shoe.deal, @shoe.deal)
        player.bankroll -= player.wager
      end
      @dealer.hand = Hand.new(@shoe.deal, @shoe.deal)
    end

    def play
      self.begin_round
      @players.each { |player| player.play_hand }
      @dealer.play_hand
      self.payout
    end
    
    def payout #this is garbage and needs refactoring
      @players.each do |player|
        player.hands.each do |hand|
          winnings = 0
          if (hand.bust? or hand < @dealer.hand)
            winnings = 0
          elsif hand > @dealer.hand
            winnings = player.wager * 2
            winnings += (player.wager * 0.5) if hand.blackjack?
          elsif hand == @dealer.hand 
            winnings = player.wager
          end
          player.bankroll += winnings
        end
      end
    end

  end
  
  class Player

    attr_accessor :bankroll, :name, :wager, :hands
    def initialize(game, name = "Player", bankroll = 0)
      @hands = []
      @hands[0] = Hand.new
      @bankroll = bankroll
      @name = name
      @game = game
      @wager = 0
    end
    
    def hit(hand = 0)
      @hands[hand].cards << @game.shoe.deal
    end

    def play_hand
      player_done = false
      while player_done == false do 
        puts "\n"
        puts @hands[0]
        if @hands[0].score == 21 or @hands[0].bust?
          player_done = true
          break
        else
          puts "#{self.name}: (H)it or (S)tand?"
          player_choice = "H"
          #player_choice = gets
          if player_choice[0].upcase == 'H' then
            self.hit
          elsif player_choice[0].upcase == 'S' then
            player_done = true
          end
        end
      end
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
        self.hit if (@hand.score == 17 and (@hand.soft? == true))           
        dealer_done = true if (@hand.score == 17 and (@hand.soft? == false))
        dealer_done = true if @hand.score >= 18
      end
    end
    
  end
  
  
  
end



