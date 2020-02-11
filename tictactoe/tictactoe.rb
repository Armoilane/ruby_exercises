class TicTacToe
  require './module/ttt_player_actions.rb'
  require './module/ttt_board_actions.rb'
  require './module/ttt_wincondition.rb'
  include PlayerActions
  include BoardActions
  include Winconditions

  def initialize
    @coordinates = []
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def game
    create_players
    print_board
    turn = 2
    9.times do
      break if wincondition?

      if turn == 2
        player1_play
        turn = 1
      else
        player2_play
        turn = 2
      end
      next
    end
    puts "Player#{turn} wins, but shouldn't have!"
  end
end

class Player
  require './module/ttt_player_actions.rb'
  include PlayerActions

  attr_accessor :name
  def initialize(name)
    @name = name
  end


end

a = TicTacToe.new
a.game

