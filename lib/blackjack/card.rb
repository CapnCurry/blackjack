module Blackjack

  class Card

    NAMES = {
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

    SUITS = {
      'H' => 'Hearts',
      'D' => 'Diamonds',
      'C' => 'Clubs',
      'S' => 'Spades',
      1 => 'Hearts',
      2 => 'Diamonds',
      3 => 'Clubs',
      4 => 'Spades'
    }

    VALUES = {
      'Ace' => [1, 11],
      'Deuce' => [2],
      'Three' => [3],
      'Four' => [4],
      'Five' => [5],
      'Six' => [6],
      'Seven' => [7],
      'Eight' => [8],
      'Nine' => [9],
      'Ten' => [10],
      'Jack' => [10],
      'Queen' => [10],
      'King' => [10]
    }
    
    attr_accessor :suit, :name
    def initialize (suit, name)
      @suit = suit
      @name = name
    end

    def value
      @value ||= VALUES[@name]
    end

    def to_s
      "#{@name} of #{@suit}"
    end
    
  end

end
