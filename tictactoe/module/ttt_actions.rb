# Methods for playing a game of TicTacToe,
# modifying the board and
# getting player input

module BoardAndPlayerActions
  def create_players
    puts 'Welcome to TicTacToe!'
    puts 'First player, by what name should we call you?'
    name1 = gets.chomp
    @player1 = Player.new(name1).assign_mark('X')
    puts "Ok #{name1} you put X on board. How about the other one?"
    name2 = gets.chomp
    @player2 = Player.new(name2).assign_mark('O')
    puts "And #{name2} you use O on board."
  end

  def assign_mark(mark)
    @mark = mark
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

  def coordinates_input
    attempt_again = true
    while attempt_again
      puts 'Give coordinates (0-2,0-2):'
      begin
        @coordinates = Kernel.gets.match(/[012],[012]/).to_s.split(',')
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
    attempt_again = true
    while attempt_again
      begin
        coordinates_input
        raise 'StandardError' unless coordinates_playable?

        attempt_again = false
      rescue StandardError
        puts "You can't take over that spot! Again!"
        retry
      end
    end
    @board[@coordinates[0].to_i][@coordinates[1].to_i] = 'X'
    print_board
  end

  def player2_play
    attempt_again = true
    while attempt_again
      begin
        coordinates_input
        raise 'StandardError' unless coordinates_playable?

        attempt_again = false
      rescue StandardError
        puts "You can't take over that spot! Again!"
        retry
      end
    end
    @board[@coordinates[0].to_i][@coordinates[1].to_i] = 'O'
    print_board
  end

  def coordinates_playable?
    @board[@coordinates[0].to_i][@coordinates[1].to_i] == ' '
  end

end
