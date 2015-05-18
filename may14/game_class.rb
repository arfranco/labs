require './player_class/'
require './board_class/'
require './computer_class/'

class Game

  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = Board.new
  end

  def win?(board)
    WINS.any? do |x, y, z|
    @board[x] == @board[y] && @board[y] == @board[z]
    end
  end

  def tie?(board)
    @board.all? { |x| x.is_a? String }
  end
  
  def game_over?(board)
    win?(@board) || tie?(@board)
  end


  def player_vs_player
  player1 = Player.new(player1)
  player2 = Player.new(player2)
  until game_over?(board)
    player1.choose_move
    player_one_turn(@board, player1.choose_move)
    @board.show
    if win?(board)
      puts "Congratulations!! You won player 1!"
      break
    elsif game_tied?
      puts "Awww seems like there's a tie!"
      break
    end 
    player2.choose_move(board)
    player_two_turn(@board, player2.choose_move)
    @board.show 
    if win?(board)
      puts "Congratulations!! You won player 2!"
      break
    elsif game_tied?(turn_count) 
      puts "Awww seems like there's a tie!"
      break 
    end
  end
  end

  def type
    game = Game.new
    puts "Please choose what type of game you'd like to play: 
          1: Player vs. Player
          2: Player vs. Computer
          3. Computer vs. Computer"
    game_type_input = gets.chomp.to_i
    if game_type_input == 1
      game.player_vs_player
    end
  end

end

game = Game.new
game.type





