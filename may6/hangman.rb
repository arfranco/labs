require 'pry'
require 'set'

words = ['cookies',
         'rails',
         'mississippi',
         'cookies',
         'terminal',
         'disease',
         'biology',
         'neuroscience',
         'mother',
         'programmer',
         'love']

turn_count = 7

def greeting
  word = words.sample
  puts "Hello! You have 7 guesses. May the odds be ever in your favor!"
end

def prompt_user
  guessed_letters = []
  puts "What's your guess?"
  user_guess = gets.chomp
  guessed_letters.push(user_guess)
end

def intermediate_word(word, guessed_letters)
  word.each_char do |letter|
    if guessed_letters.include?(letter)
      print letter
    else
      print "-"
    end
  end
  puts
end

def word_complete?(word, guessed_letters)
  word.chars.to_set.subset?(guessed_letters)
end

def game_finished?(guesses, answer, turn_count)
  turncount.zero? || word_complete?(word, guessed_letters)
end

def valid_guess?(guessed_letters, guess)
  is_letter = ('a' .. 'z').include?(guess.downcase)
  new_guess = !guessed_letters.include?(guess.downcase)
  is_letter && new_guess
end

def get_guess(guessed_letters)
  puts "Please guess a letter:"
  guess = gets.chomp
 until valid_guess?(guessed_letters, guess)
  puts "Previous guesses: #{guessed_letters.to_a}"
  puts "Please enter a letter you haven't guessed: "
  guess = gets.chomp
  end
  guess
end

def hangman(words)
  turn_count = 7
  guessed_letters = Set.new
  until game_finished?(guessed_letters, word, turn_count)
    intermediate_word(word, guessed_letters)
    guess = get_guess
    guessed_letters.add(guess)
    turn_count -= 1 unless word.include?(guess)
  end
  puts "Thanks for playing!"
end

hangman(words)

binding.pry