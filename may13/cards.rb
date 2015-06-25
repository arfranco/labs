require 'pry'

module IronYardGames
class Card

  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:diamonds, :clubs, :spades, :hearts]

  RANK_VALUES = {J: 11, Q: 12, K: 13, A: 14}

  # attr_reader :rank
  # attr_writer :rank
  attr_accessor :rank, :suit
  include Comparable

  def initialize(rank=nil, suit=nil)
    @rank = rank || RANKS.sample
    @suit = suit || SUITS.sample
  end

  def value
    val = RANK_VALUES[self.rank]
    val ||= self.rank
  end

  def <=>(other)
    self.value <=> other.value
  end


  # def rank
  #   @rank
  # end

  # def change_rank(new_rank)
  #   @rank = new_rank
  # end

  # def rank=(new_rank)
  #   @rank = new_rank
  # end

  # def suit
  #   @suit
  # end
end

  class Deck 
    # RANKS = Card::RANKS
    # SUITS = Card::SUITS
    include Enumerable

    def initialize
      @cards = []
      Card::SUITS.each do |s|
        Card::RANKS.each do |r|
          @cards << Card.new(r, s)
        end
      end
      @cards
    end

    def each
      @cards.each {|card| yield(card) } 
    end

    def draw(n)
      until n == 0
        drawn_cards = []
        drawn_card = @cards.shift 
        drawn_cards << drawn_card 
        @cards.delete(drawn_card)
        n -= 1
      end
      drawn_cards
    end

    def count
      @cards.length
    end

    def peek 
      first_card = @cards[0]
      puts "The first card in the deck right now is #{first_card}"
    end

    def shuffle
      @cards.shuffle!
    end

  end
binding.pry
end
