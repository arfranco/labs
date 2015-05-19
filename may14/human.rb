require './board'

class Human

  attr_reader :name, :character

  def initialize(name, character)
    @name = name
    @character = character
  end

  def get_move(board)
    gets.chomp.to_i
  end

  # def choose_move(board)
  #   @board.show
  #   puts "Please pick a numbered square: "
  #   result = gets.chomp.to_i
  #   available = @board.select { |x| x.is_a? Fixnum }
  #   until result =~ /^#{available}$/
  #     puts "Sorry, please pick a numbered square: "
  #     result = gets.chomp
  #   end
  #   result.to_i - 1
  # end



end

