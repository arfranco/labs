require 'minitest/autorun'

require './player_class'
require './computer_class'
require './board_class'
require './game_class'

class Tic_tac_toe_test < MiniTest::Test  

  def test_class_initialize_board
    board = Board.new
    assert_instance_of Board, board 
  end

  def test_cpu_guess
    cpu = Cpu.new("O")
    available = (1..9).to_a
    guess = cpu.select_placement(available)
    assert available.include?(guess.to_i)
  end

end 