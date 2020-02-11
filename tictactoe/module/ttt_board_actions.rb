module BoardActions
  def create_board
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def print_board
    @board.map { |i| puts i.to_s }
  end
end