module PlayerActions
  def create_players
    puts 'Welcome to TicTacToe!'
    puts 'First player, by what name should we call you?'
    name1 = gets.chomp
    @player1 = Player.new(name1)
    @player1.assign_mark('X')
    puts "Ok #{name1} you put X on board. How about the other one?"
    name2 = gets.chomp
    @player2 = Player.new(name2)
    @player2.assign_mark('O')
    puts "And #{name2} you use O on board."
  end

  def assign_mark(mark)
    @mark = mark
  end

  def make_play(player)
    puts "#{player.name}, it's your turn."
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
    @board[@coordinates[0].to_i][@coordinates[1].to_i] = "#{player.mark}"
    print_board
  end

  private

  def coordinates_playable?
    @board[@coordinates[0].to_i][@coordinates[1].to_i] == ' '
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
end