class TicTacToe
  require './module/ttt_actions.rb'
  require './module/ttt_wincondition.rb'
  include BoardAndPlayerActions
  include Winconditions

  def initialize
    @coordinates = []
    @board = Array.new(3) { Array.new(3, ' ') }
  end
end

class Player
  require './module/ttt_actions.rb'
  include BoardAndPlayerActions

  attr_accessor :name
  def initialize(name)
    @name = name
  end


end

a = TicTacToe.new
a.game

