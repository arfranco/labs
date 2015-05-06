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

guessed_letters = Set.new


def greeting
  correct_word = words.sample
  puts "Hello! You have 7 guesses. May the odds be ever in your favor!"
end

def prompt_user
  puts "What's your guess?"
  user_guess = gets.chomp
end

def intermediate_word(word, guessed_letters)
  correct_word.each_char do |letter|
    if guessed_letters.include?(letter)
      print letter
    else
      print "-"
    end
  end
  puts
end


def word_complete?(word, guessed_letters)
  guessed_letters == word.chars.to_set
end

def hangman(words)



binding.pry