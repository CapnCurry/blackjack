CARD_NAMES = {
  1 => 'Ace',
  2 => 'Deuce',
  3 => 'Three',
  4 => 'Four',
  5 => 'Five',
  6 => 'Six',
  7 => 'Seven',
  8 => 'Eight',
  9 => 'Nine',
  10 => 'Ten',
  11 => 'Jack',
  12 => 'Queen',
  13 => 'King',
  14 => 'Ace',  #Ace defined twice to allow for both ordinal methods
  15 => 'Joker'} 

BLACKJACK_VALUES = {
  1 => 1,
  2 => 2,
  3 => 3,
  4 => 4,
  5 => 5,
  6 => 6,
  7 => 7,
  8 => 8,
  9 => 9,
  10 => 10,
  11 => 10,
  12 => 10,
  13 => 10,
  14 => 11
}
 
CARD_SUITS = {
  'H' => 'Hearts',
  'D' => 'Diamonds',
  'C' => 'Clubs',
  'S' => 'Spades',
  1 => 'Hearts',
  2 => 'Diamonds',
  3 => 'Clubs',
  4 => 'Spades'
}
 

class Card
  attr_accessor :suit, :name, :value
  
  def initialize (suit, name, value)
    @suit = suit
    @name = name
    @value = value
  end

  def to_s
    "#{@name} of #{suit}"
  end
  
end

class Deck
  attr_accessor :cards
  def initialize
    @cards =[]
  end
  
  def deal
    if @cards.size>0
      dealt_card = @cards.pop
      return dealt_card
    else
      raise "The deck has been dealt out."
    end 
  end

  def shuffle
    temparray = []
    temparray << @cards.slice!(rand(@cards.size)) until
      temparray.size.eql?(@cards.size)
    @cards = temparray
  end
end


class DeckStandard < Deck
  def initialize
    super
    2.upto(14) do |n|
      1.upto(4) do |s|
        @cards << Card.new(CARD_SUITS[s], CARD_NAMES[n], BLACKJACK_VALUES[n])
      end #Suit
    end   #Names
  end     #Initialize
end       #Deck_Std

deck = DeckStandard.new
deck.shuffle

deck.cards.each do |card|
  puts card
end

puts "\n\n Here's a hand: \n\n"
1.upto(5) {puts deck.deal}
puts "\n\n Here's the rest of the deck: \n\n"
deck.cards.each do |card|
  puts card
end



  
