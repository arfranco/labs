require 'minitest/autorun'

require './human'
require './computer'
require './board'
require './game'

class Tic_tac_toe_test < MiniTest::Test  

  def test_class_initialize_board
    board = Board.new
    assert_instance_of Board, board 
  end

  def test_class_board_show
    board = Board.new
    show_board = board.show
    assert_instance_of Array, show_board
  end

  def test_humans_have_names
    anthony = Human.new("Anthony", "X")
    assert anthony.name == "Anthony"
  end

  def test_humans_have_characters
    anthony = Human.new("Anthony", "O")
    assert anthony.character == "O"
  end

  def test_cpu_initialize
    computer = Computer.new("computer", "O")
    assert computer.character == "O"
  end

  def test_tie
    board = Board.new
    @board.board = [1,2,"X", 4, "O", 6,7,8,9]
    refute @board.board == @board.tie?
  end

  def test_board_win
    board = Board.new
    @board.board = ["X", 2,3,"X", "O", "O", "X", 8,9]
    assert @board.board == @board.win
  end
end 
