require './human'
require './board'
require './computer'

class Game

  # board = Board.new
  # brit = Human.new
  # brit.choose_move(board)

  attr_accessor :player1, :player2

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
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

  def player_vs_player
    @player1 = Human.new("player 1", "X")
    @player2 = Human.new("player 2", "O")
    until self.over?
      @board.show
      puts "Please pick a numbered square player 1: "
      move = @player1.get_move(@board.board)
      @board.move(move, @player1.character)
      @board.show
      if @board.win? 
        puts "Congratulations! You won player 1!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
      puts "Please pick a numbered square player 2:"
      move = @player2.get_move(@board.board)
      @board.move(move, @player2.character)
      @board.show
      if @board.win? 
        puts "Congratulations! You won player 2!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
    end
  end

  def player_vs_computer
    @player1 = Human.new("player 1", "X")
    @player2 = Computer.new("player 2", "O")
    until self.over?
      @board.show
      puts "Please pick a numbered square player 1: "
      move = @player1.get_move(@board.board)
      @board.move(move, @player1.character)
      @board.show
      if @board.win? 
        puts "Congratulations! You won player 1!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
      puts "Please wait while computer gets move:"
      move = @player2.get_move(@board.board)
      @board.move(move, @player2.character)
      @board.show
      if @board.win? 
        puts "Congratulations! You won player 2!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
    end
  end

  def computer_vs_computer
    @player1 = Computer.new("player 1", "X")
    @player2 = Computer.new("player 2", "O")
    until self.over?
      puts "Please wait while computer gets move:"
      move = @player1.get_move(@board.board)
      @board.move(move, @player1.character)
      @board.show
      if @board.win? 
        puts "Congratulations! You won!"
        break
      elsif @board.tie?
        puts "Aww man! Seems like there's a tie."
        break
      end
      puts "Please wait while computer gets move:"
      move = @player2.get_move(@board.board)
      @board.move(move, @player2.character)
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

  def play
    game = Game.new
    choice = game.type
    if choice == 1 
      self.player_vs_player
    elsif choice == 2
      self.player_vs_computer
    else
      self.computer_vs_computer
    end
  end

  def play_again?
    puts "Would you like to play again? 'yes' or 'no'"
    input = gets.chomp.downcase
    if input == 'yes'
      new_game = Game.new
      new_game.play
    else
      puts "No problem. Hope you had fun!"
    end
  end

end

game = Game.new
game.play
game.play_again?



