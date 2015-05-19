require './human'


class Board
 WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show
    puts "                 "
    puts "                 "
    puts "                 "
    puts "                 "
    puts "                 "
    puts "+-----+-----+-----+"
    puts "|  #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  |"
    puts "+-----+-----+-----+"
    puts "|  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  |"
    puts "+-----+-----+-----+"
    puts "|  #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  |"
    puts "+-----+-----+-----+"
    puts "                 "
    puts "                 "
    puts "                 "
    puts "                 "
    puts "                 "
    puts "                 "
    puts "                 "
    puts "                 "
  end

   def tie?
    @board.all? { |x| x.is_a? String }
  end

  def move(move, character)
    @board[move-1] = character
  end

   def win?
    WINS.any? do |x, y, z|
    @board[x] == @board[y] && @board[y] == @board[z]
    end
  end
 

end

