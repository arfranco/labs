require './board_class/'

class Player

  def initialize
    @player = player
    @board = [1,2,3,4,5,6,7,8,9]
  end

  def choose_move
    @board.show
    puts "Please pick a numbered square: "
    result = gets.chomp
    available = @board.select { |x| x.is_a? Fixnum }
    until result =~ /^#{available}$/
      puts "Sorry, please pick a numbered square: "
      result = gets.chomp
    end
    result.to_i - 1
  end

  def player_one_turn(board, player_one_move)
    @board = Board.new
    @board[choose_move] = "X"
  end

  def player_two_turn(board, player_two_move)
    @board = Board.new
    @board[choose_move] = "O"
  end

end

