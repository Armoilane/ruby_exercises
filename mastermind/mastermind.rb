# frozen_string_literal: true

# Mastermind as a part of the odin project. 
# Some common methods with the AI could be merged 
# and put into a module with a bit of refactoring.
# The AI doesn't really work yet. Check the comment 
# in the mastermind_ai.rb why. 

class Mastermind
  COLOR = %w[blue yellow red green brown purple].freeze

  require_relative './mastermind_ai'

  def initialize
    @rounds = 12
    @codelength = 4
    @code = []
    @player_guesses = []
    @side = ''
  end

  def welcome
    puts '\tWelcome to mastermind.'
    puts 'Would you like to scratch your head'
    puts 'to guess the computer generated code OR..'
    puts 'test the AI with a code to solve?'
    choose_side
  end

  def choose_side
    puts "Please type 'guess' or 'test'"
    @side << gets.chomp
    p @side
    if @side == 'guess'
      play_rounds
    elsif @side == 'test'
      give_code_for_ai
    else
      puts 'typoed!'
    end
  end

  def give_code_for_ai
    puts 'Let\'s test the AI!'
    puts 'Please give a four color code to solve.'
    puts "The possible colors are #{COLOR.join(', ')}."
    puts 'Just type them in separated by spaces.'
    code = gets.chomp.split(/\W/)
    computer_plays(code)
  end

  def computer_plays(code)
    MastermindAi.new(code)
  end

  def play_rounds
    create_code
    while @rounds.positive?
      puts "You have #{@rounds} rounds left."
      player_guess
      break if find_matching_indexes == 4

      give_feedback
      @rounds -= 1
    end
    puts 'You got it you mastermind you!'
  end

  def give_feedback
    puts "\tYour guesses in order are #{@player_guesses}."
    puts "\tThere are #{find_matching_indexes} colors in correct positions, and"
    puts "\t#{number_of_correct_colors} colors guessed that appear in the code."
  end

  def find_matching_indexes
    @correctly_guessed_indexes = []
    @code.each_with_index do |color, index|
      @correctly_guessed_indexes << index if @player_guesses[index] == color
    end
    @correctly_guessed_indexes.length
  end

  def number_of_correct_colors
    (unmatched_in_codes & unmatched_in_guesses).length
  end

  def unmatched_in_guesses
    @player_guesses.map.with_index do |color, index|
      color unless @correctly_guessed_indexes.include?(index)
    end.compact
  end

  def unmatched_in_codes
    @code.map.with_index do |color, index|
      color unless @correctly_guessed_indexes.include?(index)
    end.compact
  end

  def player_guess
    puts "Try to guess the #{@codelength} colors in the code."
    puts "The possible colors are #{COLOR.join(", ")}."
    puts 'Just type them in separated by spaces.'
    @player_guesses = gets.chomp.split(/\W/)
  end

  def create_code
    @codelength.times do
      @code << COLOR[rand(6)]
    end
  end
end

a = Mastermind.new
a.welcome