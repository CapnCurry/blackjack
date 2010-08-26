require 'spec_helper'

describe Blackjack::Hand, 'with a Ten and Five' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :five))
  end

  it "is scored as 15" do
    subject.score.should == 15
  end

 # it "does not have a scoring choice" do
 #   subject.should_not be_scoring_choice
 # end

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

#  it "does have a scoring choice" do
#    subject.should be_scoring_choice
#  end

  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Ten, Jack, and Ace' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :jack))
    hand.hit(Blackjack::Card.new(:hearts, :ace))
    hand
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

describe Blackjack::Hand, 'with a Ten, Jack, and Deuce' do

  subject do
    hand = Blackjack::Hand.new(Blackjack::Card.new(:hearts, :ten), Blackjack::Card.new(:hearts, :jack))
    hand.hit(Blackjack::Card.new(:hearts, :deuce))
    hand
  end


 # it "does not have a scoring choice" do
 #   subject.should_not be_scoring_choice
 # end

  it "is scored as 22" do
    subject.score.should == 22
  end

  
  it "is bust" do
    subject.should be_bust
  end

end




