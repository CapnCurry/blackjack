require 'spec_helper'

describe Blackjack::Ruleset, 'The Default Game Ruleset' do
  
  subject { Blackjack::Ruleset.new }
  
  it "calls for two decks" do
    subject.deck_size.should == 2
  end
  
  it "allows Six-Card Charlie wins" do
    subject.charlie.should == 6
  end
  
  it "wants standard Poker decks" do
    subject.deck_type.should == 'P'
  end
  
end

describe Blackjack::Ruleset, 'The Spanish Game Rules' do
  
  subject do
    #SPANISH_GAME = ['S', 2, [10,11], 2, false, false, true, false, 26, [3, 500]]
    Blackjack::Ruleset.new(*Blackjack::SPANISH_GAME)
  end
  
  it "calls for two decks" do
    subject.deck_size.should == 2
  end
  
  it "should pay 3:2 on Blackjack" do
    subject.blackjack_pays.should == 2.5
  end
  
  it "wants the Spanish deck" do
    subject.deck_type.should == 'S'
  end
  

end

