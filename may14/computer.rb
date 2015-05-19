require './board'
class Computer

attr_reader :name, :character

  def initialize(name, character)
    @name = name
    @character = character
  end

  def get_move(board)
    sleep(2)
    available = board.select { |x| x.is_a? Fixnum }
    move = available.sample - 1
    move
  end

  

end

# p1 = Human.new(Brit, X)
# p2 = Human.new(Name, O)
# game = ttt(board, p1, p2)