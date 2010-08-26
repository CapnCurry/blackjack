require 'spec_helper'

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

describe Blackjack::Game, 'A Blackjack game' do

  subject do
    Blackjack::Game.new
  end
  
  it "should have a shoe" do
    subject.shoe.size.should > 0 
  end

  it "should have at least one player" do
    subject.players[0].name.size > 0
  end

  it "should be able to accept bets" do
    subject.players[0].bet_size >0
  end

  it "should deal a new hand to the first player" do
    subject.begin_round
    subject.players[0].hands[0].cards.size == 2
  end

  it "should deal a hand to the dealer" do
    subject.begin_round
    subject.dealer.hand.cards.size == 2
  end
  
end

describe Blackjack::Dealer, 'A Blackjack dealer with a five and six' do
  
  subject do
    dealer = Blackjack::Dealer.new(Blackjack::Game.new)
    dealer.hand.hit Blackjack::Card.new(:hearts, :five)
    dealer.hand.hit Blackjack::Card.new(:hearts, :six)
    dealer
  end

  it "Should have a hand score of 11" do
    subject.hand.score.should == 11
  end
  
  it "Should hit" do
    subject.evaluate
    subject.hand.cards.size.should > 2
  end

  
end
