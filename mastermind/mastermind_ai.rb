# frozen_string_literal: true

# Mastermind Ai unfinished. Didn't want to make it cheat by
# giving it the correct index info when matching, only the number of
# matches. That's when it got tricky. I use the hit_counts variables
# for that info in this first draft.
# To be finished later. If to be finished. I'll think about it.

class MastermindAi
  COLOR = %w[blue yellow red green brown purple].freeze

  attr_accessor :code, :ai_guess

  def initialize(code)
    @code = code
    @attempts = 4
    @codelength = 4
    @ai_guess = []
    @previous_blacks = 0
    @hit_counts = Hash.new(0)
    @white_counts = Hash.new(0)
    ai_solver
  end

  def ai_solver
    @attempts.times do
      @ai_guess = []
      p create_ai_guess
      give_feedback_to_ai
      p @previous_blacks
      p @blacks
      p @whites
      p blacks_changed?
      increase_hit_counts_black
      increase_hit_counts_white
      @previous_blacks = @blacks
      p @hit_counts
      p @white_counts
      puts "end"
    end
  end

  def increase_hit_counts_white
    return unless @whites.positive?

    @ai_guess.uniq.each { |color| @white_counts[color] += 1 }
  end

  def increase_hit_counts_black
    return unless @blacks > @previous_blacks

    @ai_guess.each { |color| @hit_counts[color] += 1 }
  end

  def create_ai_guess
    # initial_guess = [COLOR[0], COLOR[0], COLOR[1], COLOR[1]]
    # @ai_guess = initial_guess
    @ai_guess = Array.new(4) { COLOR[rand(6)] }
  end

  def blacks_changed?
    @blacks <=> @previous_blacks
  end

  def give_feedback_to_ai
    @blacks = number_of_matching_indexes
    @whites = number_of_correct_colors
  end

  def number_of_matching_indexes
    @correctly_guessed_indexes = []
    @code.each_with_index do |color, index|
      @correctly_guessed_indexes << index if @ai_guess[index] == color
    end
    @correctly_guessed_indexes.length
  end

  def number_of_correct_colors
    (unmatched_in_codes & unmatched_in_guesses).length
  end

  def unmatched_in_guesses
    @ai_guess.map.with_index do |color, index|
      color unless @correctly_guessed_indexes.include?(index)
    end.compact
  end

  def unmatched_in_codes
    @code.map.with_index do |color, index|
      color unless @correctly_guessed_indexes.include?(index)
    end.compact
  end
end
