require 'minitest/autorun'

require './player_class'
require './computer_class'
require './board_class'

class Tic_tac_toe_test < MiniTest::Test  

  def test_class_initialize_board
    board = Board.new
    assert_instance_of Board, board 
  end

end 