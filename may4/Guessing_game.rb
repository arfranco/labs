def guessing_game 
	correct_num = rand(100)
 
puts "Guess number between 0 and 100:"
guess = gets.chomp.to_i

until guess == correct_num
  if guess < correct_num
  	puts "Guessed too low"
  	guess = gets.chomp.to_i
  elsif guess > correct_num
  	puts "Guessed too high"
  	guess = gets.chomp.to_i
  end
end
 
if guess == correct_num
	puts "Congratulations! You guessed it!"
end
end

guessing_game

puts "Would you like to play again?"
	answer = gets.chomp
	if answer == "yes"
	guessing_game
	 end


puts "Ok no problem! :)"





