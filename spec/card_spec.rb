require 'spec_helper'

describe Blackjack::Card, 'Ace' do
  
  subject { Blackjack::Card.new('Hearts', 'Ace') }
  
  it "should have 1 and 11 as values" do
    subject.value.should == [1, 11]
  end
  
end
