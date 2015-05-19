require './human'
require './board'
require './computer'

class Game

  # board = Board.new
  # brit = Human.new
  # brit.choose_move(board)

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
  end

  def turn(move, player)
    @board.move(move, player.character)
  end
  
  def over?
    @board.win? || @board.tie?
  end


  def type
    puts "Welcome! Please choose what type of game you'd like to play:
          1: Player vs. Player
          2: Player vs. Computer
          3. Computer vs. Computer"
   choice = gets.chomp.to_i
  end

  def play
  game = Game.new
  choice = game.type
  if choice == 1 
    @player1 = Human.new("player 1", "X")
    @player2 = Human.new("player 2", "O")
    until game.over?
      @board.show
      puts "Please pick a numbered square: "
      move = @player1.get_move(@board)
      game.turn(move, @player1)
      @board.show
      if @board.win? 
        puts "Congratulations! You won!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
      puts "Please pick a numbered square:"
      @player2.get_move(@board)
      game.turn(@player2)
      @board.show
      if game.win? 
        puts "COngratulations! You won!"
        break
      elsif game.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
    end
  elsif choice == 2
    @player1 = Human.new("player 1", "X")
    @player2 = Computer.new("player 2", "O")
    until game.over?
      @board.show
      puts "Please pick a numbered square: "
      @player1.get_move(@board)
      game.turn(@player1)
      @board.show
      if @board.win? 
        puts "Congratulations! You won!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
      puts "Please wait while computer gets move:"
      @player2.get_move(@board)
      game.turn(@player2)
      @board.show
      if @board.win? 
        puts "Congratulations! You won!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
    end
  else
    @player1 = Computer.new("player 1", "X")
    @player2 = Computer.new("player 2", "O")
    until game.over?
      puts "Please wait while computer gets move:"
      @player1.get_move(@board)
      game.turn(@player1)
      @board.show
      if @board.win? 
        puts "COngratulations! You won!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
      puts "Please wait while computer gets move:"
      @player2.get_move(@board)
      game.turn(@player2)
      @board.show
      if @board.win? 
        puts "Congratulations! You won!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
    end
  end
end
end


game = Game.new
game.play




