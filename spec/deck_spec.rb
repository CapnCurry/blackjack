require 'spec_helper'

describe Blackjack::Deck do

  it 'has 52 cards' do
    Blackjack::Deck.new.cards.size.should == 52
  end

end
