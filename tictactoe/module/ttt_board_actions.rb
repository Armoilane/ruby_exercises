module BoardActions
  def print_board
    @board.map { |i| puts i.to_s }
  end
  
end