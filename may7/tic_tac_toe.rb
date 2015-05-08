require 'pry'

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def show_board(board)
  puts "                 "
  puts "  #{board[0]}  |  #{board[1]}  |  #{board[2]}  "
  puts "-----+-----+-----"
  puts "  #{board[3]}  |  #{board[4]}  |  #{board[5]} "
  puts "-----+-----+-----"
  puts "  #{board[6]}  |  #{board[7]}  |  #{board[8]} "
  puts "                 "
end

def greeting(board)
  puts "Hello! Would you like to play tic tac toe?"
  user_input_playgame = gets.chomp.downcase
  until user_input_playgame == "yes" || user_input_playgame =="y"
    if user_input_playgame =~ /\d/
      puts "Whoops! Looks like you typed in a number instead of yes or no. Would you like to play tic tac toe? That totally accidentally ryhmed!('y' or 'n')"
      user_input_playgame = gets.chomp.downcase
    elsif user_input_playgame == "no" or user_input_playgame == "n"
        puts "No problem young gamer. Perhaps you'd like to play next time."
        break
    else
      puts "I'm sorry I didn't understand your response. Would you like to play tic tac toe? Please enter yes or no:"
      user_input_playgame = gets.chomp.downcase
    end
  end
  if user_input_playgame == "yes" || user_input_playgame == "y"
    puts "Great! Let's get started"
    show_board(board)
  end
end


binding.pry




  if user_input_playgame == "yes" || user_input_playgame == "y"
    puts "First off, do you have someone to play with or do you need an opponent?"
    user_input_player = gets.chomp.downcase
  end
  if user_input_play.include?("opponent")

binding.pry

