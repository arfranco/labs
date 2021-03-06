require 'set'

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def show_board(board)
  puts "                 "
  puts "                 "
  puts "                 "
  puts "                 "
  puts "                 "
  puts "+-----+-----+-----+"
  puts "|  #{board[0]}  |  #{board[1]}  |  #{board[2]}  |"
  puts "+-----+-----+-----+"
  puts "|  #{board[3]}  |  #{board[4]}  |  #{board[5]}  |"
  puts "+-----+-----+-----+"
  puts "|  #{board[6]}  |  #{board[7]}  |  #{board[8]}  |"
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
    two_player?(board)
  end
end

def two_player?(board)
  puts "Will you be playing with somebody else? ('yes' or 'no')"
  user_input_two_player = gets.chomp.downcase
  if user_input_two_player == "yes" || user_input_two_player == "y" 
    puts "Awesome! Decide who goes first and have fun!" 
    show_board(board)
    player_vs_player(board)
  elsif user_input_two_player == "no"
    cpu_player?(board)
  elsif user_input_two_player =~ /\d/
      puts "Whoops! Looks like you typed in a number instead of yes or no. Do you have someone to play with?('y' or 'n')"
      user_input_two_player = gets.chomp.downcase
  else
    puts "Please answer with Yes or No"
    two_player?(board)
  end
end

def cpu_player?(board)
puts "Would you like to play me then?"
user_input_cpu_player = gets.chomp.downcase
    if user_input_cpu_player == "yes" || user_input_cpu_player =="y"
      puts "Great! Let's get started"
      show_board(board)
    computer_play(board)
    elsif user_input_cpu_player =~ /\d/
      puts "Whoops! Looks like you typed in a number instead of yes or no. Would you like to play tic tac toe with me the computer? ('y' or 'n')"
      user_input_cpu_player = gets.chomp.downcase
    elsif user_input_cpu_player == "no" or user_input_cpu_player == "n"
      puts "No problem young gamer. Perhaps you'd like to play next time."
    else 
      puts "I'm sorry I didn't understand your response. Would you like to play tic tac toe with me the computer? Please enter 'yes' or 'no':"
      user_input_cpu_player = gets.chomp.downcase
    end
end

def game_finished?(user1_numbers, user2_numbers, turn_count)
  win?(user1_numbers) || win?(user2_numbers) || game_tied?(turn_count)
end

def game_tied?(turn_count)
   turn_count.zero?
end

def win?(user_numbers)
  winning_numbers =[[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  game_won = false
  winning_numbers.each do |win|
    if win.to_set.subset?(user_numbers)
      game_won = true
      break
    else
      game_won = false
    end
  end
  game_won
end

def player_one_turn(board, player_one_move)
  board[player_one_move.to_i - 1] = "X"
  show_board(board)
end

def player_two_turn(board, player_two_move)
  board[player_two_move.to_i - 1] = "O"
  show_board(board)
end

 def computer_move(board)
  sleep(2)
  available = board.select { |x| x.is_a? Fixnum }
  random_choice = available.sample
  board[random_choice-1] = "O" 
  show_board(board)
  random_choice
end

def player_vs_player(board)
  turn_count = 9
  user1_numbers = Set.new
  user2_numbers = Set.new
  until game_finished?(user1_numbers, user2_numbers, turn_count) 
    puts "What is your move player 1?:"
    player_one_move = gets.chomp
    available = board.select { |x| x.is_a? Fixnum }
    until player_one_move =~ /^#{available}$/
    puts "Sorry, that number was already picked. Please pick a numbered square: "
    player_one_move = gets.chomp
    end
    player_one_move = player_one_move.to_i
    player_one_turn(board, player_one_move)
    user1_numbers.add(player_one_move)
    turn_count -= 1
  if win?(user1_numbers) 
    puts "Congratulations!! You won player 1!"
    break
    elsif game_tied?(turn_count) 
      puts "Awww seems like there's a tie!"
      break
    end 
    puts "What is your move player 2?"
    player_two_move = gets.chomp
    available = board.select { |x| x.is_a? Fixnum }
    until player_two_move =~ /^#{available}$/
    puts "Sorry, that number was already picked. Please pick a numbered square: "
    player_two_move = gets.chomp
    end
    player_two_move = player_two_move.to_i
    player_two_turn(board, player_two_move)
    user2_numbers.add(player_two_move)
    turn_count -= 1   
  if win?(user2_numbers) 
    puts "Congratulations!! You won player 2!"
    break
    elsif game_tied?(turn_count) 
      puts "Awww seems like there's a tie!"
      break 
    end
  end
end

def computer_play(board)
  turn_count = 9
  user1_numbers = Set.new
  comp_numbers = Set.new
  until game_finished?(user1_numbers, comp_numbers, turn_count) 
    puts "What is your move player 1?:"
    player_one_move = gets.chomp.to_i
    player_one_turn(board, player_one_move)
    user1_numbers.add(player_one_move)
    turn_count -= 1
  if win?(user1_numbers) 
    puts "Congratulations!! You won player 1!"
    break
    elsif game_tied?(turn_count) 
      puts "Awww seems like there's a tie!"
      break
  end 
    puts "The computer is thinking about it's next move."
    move = computer_move(board)
    puts "The computer selected #{move}"
    comp_numbers.add(move)
    turn_count -= 1  
  if win?(comp_numbers) 
    puts "Awww looks like the computer won!"
    break
    elsif game_tied?(turn_count) 
      puts "Awww seems like there's a tie!"
      break 
    end
  end
end

greeting(board)

