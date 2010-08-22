require 'spec_helper'

describe Blackjack::Hand, 'with a Ten and Five' do

  subject do
    hand = Blackjack::Hand.new
    hand << Blackjack::Card.new('Hearts', 'Ten')
    hand << Blackjack::Card.new('Hearts', 'Five')
    hand
  end

  it "is scored as 15" do
    subject.score.should == [15]
  end

  it "does not have a scoring choice" do
    subject.should_not be_scoring_choice
  end

  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Ten and Ace' do

  subject do
    hand = Blackjack::Hand.new
    hand << Blackjack::Card.new('Hearts', 'Ten')
    hand << Blackjack::Card.new('Hearts', 'Ace')
    hand
  end

  it "is scored as 11 and 21" do
    subject.score.sort.should == [11, 21]
  end

  it "does have a scoring choice" do
    subject.should be_scoring_choice
  end

  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Ten, Jack, and Ace' do

  subject do
    hand = Blackjack::Hand.new

    hand << Blackjack::Card.new('Hearts', 'Ten')
    hand << Blackjack::Card.new('Hearts', 'Jack')
    hand << Blackjack::Card.new('Hearts', 'Ace')
    hand
  end

  it "is scored as 21 and 31" do
    subject.score.sort.should == [21, 31]
  end

  it "does have a scoring choice" do
    subject.should be_scoring_choice
  end

  it "is not bust" do
    subject.should_not be_bust
  end

end

describe Blackjack::Hand, 'with a Ten, Jack, and Deuce' do

  subject do
    hand = Blackjack::Hand.new
    hand << Blackjack::Card.new('Hearts', 'Ten')
    hand << Blackjack::Card.new('Diamonds', 'Jack')
    hand << Blackjack::Card.new('Clubs', 'Deuce')
    hand
  end

  it "is scored as 22" do
    subject.score.sort.should == [22]
  end

  it "does not have a scoring choice" do
    subject.should_not be_scoring_choice
  end

  it "is bust" do
    subject.should be_bust
  end

end




