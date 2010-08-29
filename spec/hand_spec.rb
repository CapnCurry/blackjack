require 'spec_helper'

describe Blackjack::Hand, 'with a Six and Five' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :six), Blackjack::Card.new(:hearts, :five))
  end

  it "is scored as 11" do
    subject.score.should == 11
  end

  it "is not splittable" do
    subject.splittable?.should == false
  end

  it "is doubleable" do
    subject.doubleable?.should == true
  end

  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Ten and Five' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :five))
  end

  it "is scored as 15" do
    subject.score.should == 15
  end

  it "is not splittable" do
    subject.splittable?.should == false
  end

  it "is not doubleable" do
    subject.doubleable?.should == false
  end
    
  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Ten and Ace' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :ace))
  end

  it "is scored as 21" do
    subject.score.should == 21
  end

  it "pushes a blackjack" do
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :king), Blackjack::Card.new(:hearts, :ace))
    subject == other_hand
  end

  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Ten, Jack, and Ace' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :jack))
    hand.cards <<(Blackjack::Card.new(:hearts, :ace))
    hand
  end

  it "loses to a blackjack of Ten and Ace" do
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :ace))
    subject.should < other_hand
  end

  
  it "is scored as 21" do
    subject.score.should == 21
  end

#  it "does have a scoring choice" do
#    subject.should be_scoring_choice
#  end
  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Deuce and Ace' do
  
  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :deuce), Blackjack::Card.new(:hearts, :ace))
    hand
  end
  
  it "is scored as 13" do
    subject.score.should == 13
  end

  it "is not bust" do
    subject.should_not be_bust
  end

  it "is soft" do
    subject.should be_soft
  end
  
end

describe Blackjack::Hand, 'with a Ten, Six, and Four' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :six))
    hand.cards << (Blackjack::Card.new(:hearts, :four))
    hand
  end

  it "beats a hand of Ten, Six, and Three" do
    
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :six))
    other_hand.cards << (Blackjack::Card.new(:hearts, :three))
    subject.should > other_hand
  end

  it "pushes a hand of Ten, Five, and Five" do
    
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :five))
    other_hand.cards << (Blackjack::Card.new(:hearts, :five))
    subject.should == other_hand
  end

  it "is not splittable" do
    subject.splittable?.should == false
  end

  
  it "loses to a hand of Ten, Six, and Five" do
    
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :six))
    other_hand.cards << (Blackjack::Card.new(:hearts, :five))
    subject.should < other_hand
  end

  it "is not soft" do
    subject.should_not be_soft
  end
  
end
 
describe Blackjack::Hand, 'A Blackjack of ten and ace' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :ace))
  end

  it "beats a hand of Ten, Six, and Five" do
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :six))
    other_hand.cards << (Blackjack::Card.new(:hearts, :five))
    subject.should > other_hand
  end

  it "pushes a hand of Jack and Ace" do
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :jack), Blackjack::Card.new(:hearts, :ace))
    subject.should == other_hand
  end
end

describe Blackjack::Hand, 'A Blackjack of ten and king' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :king))
  end

  it "loses to a hand of Ten, Six, and Five" do
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :six))
    other_hand.cards << (Blackjack::Card.new(:hearts, :five))
    subject.should < other_hand
  end

  it "pushes a hand of Jack and Ten" do
    other_hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :jack), Blackjack::Card.new(:hearts, :ten))
    subject.should == other_hand
  end

  it "is splittable" do
    subject.splittable?.should == true
  end
  
end

