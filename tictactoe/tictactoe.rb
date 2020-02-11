class TicTacToe
  require './module/ttt_player_actions.rb'
  require './module/ttt_board_actions.rb'
  require './module/ttt_wincondition.rb'
  include PlayerActions
  include BoardActions
  include Winconditions

  def initialize
    @coordinates = []
    create_board
  end

  def game
    create_players
    print_board
    turn = 2
    9.times do
      break if wincondition?

      if turn == 2
        make_play(@player1)
        turn = 1
      else
        make_play(@player2)
        turn = 2
      end
      next
    end
    puts "Someone wins, but shouldn't have!"
  end
end

class Player
  require './module/ttt_player_actions.rb'
  include PlayerActions

  attr_accessor :name, :mark
  def initialize(name)
    @name = name
  end
end

a = TicTacToe.new
a.game

