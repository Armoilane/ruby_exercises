class Mastermind
  COLOR = %w(blue yellow red green brown purple)

  def initialize
    @rounds = 12
    @codelength = 4
    @code = Array.new
    @player_guesses = Array.new
    # @positions_correct = 0
  end

  def play_rounds
    create_code
    while @rounds.positive? do
      puts "#{@rounds} rounds left."
      player_guess
      break if number_of_correct_color_positions == 4

      give_feedback
      @rounds -= 1
    end
    puts "You got it you mastermind you!"
  end

  def give_feedback
    puts "Your guesses in order are #{@player_guesses}."
    puts "There are #{number_of_correct_color_positions} colors in correct positions, and"
    puts "#{number_of_correct_colors} colors guessed that appear in the code."
  end

  def number_of_correct_color_positions
    @positions_correct = 0
    @code.each_with_index do |color, index|
      @positions_correct += 1 if @player_guesses[index] == color
    end
    @positions_correct
  end

  def number_of_correct_colors
    (@player_guesses & @code).length
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
a.play_rounds