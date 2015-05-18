class Computer

  def choose_move(board)
    sleep(2)
    available = board.select { |x| x.is_a? Fixnum }
    move = available.sample
    board.update
  end

end