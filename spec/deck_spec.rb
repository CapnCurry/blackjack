require 'spec_helper'

describe Blackjack::StandardDeck do

  subject { Blackjack::StandardDeck.new }
  
  it 'has 52 cards' do
    subject.size.should == 52
  end

  describe 'dealing' do

    it 'give a card' do
      subject.deal.should be_a(Blackjack::Card)
    end

    it 'change the deck size' do
      lambda { subject.deal }.should change(subject, :size).by(-1)
    end

  end
  
end


describe Blackjack::InfiniteDeck do

  subject { Blackjack::InfiniteDeck.new }
  
  it 'has infinite cards' do
    subject.size.should == 1/0.0
  end

  describe 'dealing' do

    it 'give a card' do
      subject.deal.should be_a(Blackjack::Card)
    end

    it 'not change the deck size' do
      lambda { subject.deal }.should_not change(subject, :size)
    end

  end

end

describe Blackjack::SpanishDeck do

  subject { Blackjack::SpanishDeck.new }
  
  it 'has 48 cards' do
    subject.size.should == 48
  end

  describe 'dealing' do

    it 'give a card' do
      subject.deal.should be_a(Blackjack::Card)
    end

    it 'change the deck size' do
      lambda { subject.deal }.should change(subject, :size).by(-1)
    end

  end

end
