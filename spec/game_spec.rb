require 'spec_helper'


describe Blackjack::Game, 'A Game of Blackjack' do

  subject do
    game = Blackjack::Game.new    
  end



end


describe Blackjack::Player, 'A Blackjack player' do

  subject do
    player = Blackjack::Player.new(Blackjack::Game.new)
  end

  it "should accept a bankroll of $500" do
    subject.bankroll = 500
    subject.bankroll.should == 500
  end

  it "should have an addressable name" do
    subject.name.size.should > 0
  end
  
  
end

describe Blackjack::Game, 'A rigged Blackjack game' do
  subject do
    Blackjack::Game.new
  end

  it "should pay this out correctly" do

    subject.players[0].hands[0] = Blackjack::Hand.new(Blackjack::Card.new(:jackasses, :ten), Blackjack::Card.new(:jackasses, :ten))
    subject.players[1].hands[0] = Blackjack::Hand.new(Blackjack::Card.new(:jackasses, :five), Blackjack::Card.new(:jackasses, :ten))
    subject.players[2].hands[0] = Blackjack::Hand.new(Blackjack::Card.new(:jackasses, :five), Blackjack::Card.new(:jackasses, :three))
    subject.players[3].hands[0] = Blackjack::Hand.new(Blackjack::Card.new(:jackasses, :ace), Blackjack::Card.new(:jackasses, :ten))
    subject.dealer.hand = Blackjack::Hand.new(Blackjack::Card.new(:jackasses, :ten), Blackjack::Card.new(:jackasses, :five))
    subject.payout

#    puts subject.players[3].hands[0].score
#    puts subject.players[3].hands[0].bust?
#    puts subject.players[3].hands[0].blackjack?
#    puts subject.dealer.hand.score
#    puts subject.players[3].hands[0] > subject.dealer.hand
#[subject.players[0].bankroll, subject.players[1].bankroll, subject.players[2].bankroll, subject.players[3].bankroll].should == [700, 600, 500, 750]
  end
  
  
end


describe Blackjack::Game, 'A Blackjack game' do

  subject do
    Blackjack::Game.new
  end
 
  it "should have a shoe" do
    subject.shoe.size.should > 0 
  end

  it "should allow the shoe to be shuffled" do
    subject.shoe.shuffle!
    subject.shoe.cards.size.should > 0
  end

  it "should have at least one player" do
    subject.players[0].name.size > 0
  end

  it "should be able to accept bets" do
    subject.players[0].bet_size >0
  end

  it "should deal a new hand to the first player" do
    subject.begin_round
    subject.players[0].hands[0].cards.size.should == 2
  end

  it "should deal a hand to the dealer" do
    subject.begin_round
    subject.dealer.hand.cards.size.should == 2
  end

  it "should play a game" do
   # puts subject.players[0].bankroll
   # puts subject.players[0].bet_size
   # puts subject.players[1].bankroll
   # puts subject.players[1].bet_size
   # puts subject.players[2].bankroll
   # puts subject.players[2].bet_size
   # puts subject.players[3].bankroll
   # puts subject.players[3].bet_size
    #
    #subject.play
    #puts "Results:"
    #puts subject.players[0].hands[0]
    #puts subject.players[1].hands[0]
    #puts subject.players[2].hands[0]
    #puts subject.players[3].hands[0]
    #puts "Dealer has:"
    #puts subject.dealer.hand
    #puts "Bankroll results:"
    #puts subject.players[0].bankroll
    #puts subject.players[1].bankroll
    #puts subject.players[2].bankroll
    #puts subject.players[3].bankroll
  end
end

describe Blackjack::Dealer, 'A Blackjack dealer with a five and six' do
  
  subject do 
    game = Blackjack::Game.new
    game.dealer.hand.cards << Blackjack::Card.new(:hearts, :five)
    game.dealer.hand.cards << Blackjack::Card.new(:hearts, :six)
    game.dealer
  end

  it "Should have a hand score of 11" do
    subject.hand.score.should == 11
  end
  
  it "Should hit" do
    subject.play_hand
    subject.hand.cards.size.should > 2
  end

  
end

describe Blackjack::Dealer, 'A Blackjack dealer with a ten and seven' do
  
  subject do 
    game = Blackjack::Game.new
    game.dealer.hand.cards = []
    game.dealer.hand.cards << Blackjack::Card.new(:clubs, :ten)
    game.dealer.hand.cards << Blackjack::Card.new(:hearts, :seven)
    game.dealer
  end

  it "Should have a hand score of 17" do
    subject.hand.score.should == 17
  end

  it "Should not show a soft hand" do
    subject.hand.soft?.should == false
  end

  it "Should evaluate hand.score == 17 and hand.soft? as false" do
    (subject.hand.score == 17 and subject.hand.soft?).should == false
end

    
  
  it "Should stand" do
    subject.play_hand
    subject.hand.cards.size.should == 2
  end

  
end
