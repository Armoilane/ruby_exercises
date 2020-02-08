class TicTacToe

  require './ttt_actions.rb'
  require './ttt_wincondition.rb'
  include BoardAndPlayerActions
  include Winconditions

  def initialize
    @coordinates = []
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def game
    turn = 1
    9.times do
      break if wincondition?
      if turn == 1
        player1_play
        turn = 2
      else
        player2_play
        turn = 1
      end
      next
    end
    puts "Someone wins! #{turn}"
  end
  
end

a = TicTacToe.new
a.print_board
a.game
