# Methods for playing a game of TicTacToe,
# modifying the board and 
# getting player input

module BoardAndPlayerActions

  def get_coordinates
    attempt_again = true
    while attempt_again
      puts 'Give coordinates (0-2,0-2):'
      begin
        @coordinates = Kernel.gets.match(/[012],[012]/).to_s.split(",")
        raise 'StandardError' unless @coordinates.length == 2

        attempt_again = false
      rescue StandardError
        puts 'Silly coordinates! Give numbers 0-2,0-2.'
        retry
      end
    end
    @coordinates
  end

  def print_board
    @board.map { |i| puts i.to_s }
  end

  def player1_play
    get_coordinates
    @board[@coordinates[0].to_i][@coordinates[1].to_i] = "X"
    print_board
  end

  def player2_play
    get_coordinates
    @board[@coordinates[0].to_i][@coordinates[1].to_i] = "O"
    print_board
  end

end
