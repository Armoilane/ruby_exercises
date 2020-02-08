module Winconditions
  
  def wincondition?
    full_diagonal? || full_row? || full_column?
  end

  def full_column?
    col_full_of_x = @board.transpose.map { |row| row.all? { |c| c == 'X' } }
    col_full_of_o = @board.transpose.map { |row| row.all? { |c| c == 'O' } }
    col_full_of_x.any? || col_full_of_o.any?
  end

  def full_row?
    row_full_of_x = @board.map { |row| row.all? { |c| c == 'X' } }
    row_full_of_o = @board.map { |row| row.all? { |c| c == 'O' } }
    row_full_of_x.any? || row_full_of_o.any?
  end

  def full_diagonal?
    diagonal1 = [@board[0][0], @board[1][1], @board[2][2]]
    diagonal2 = [@board[0][2], @board[1][1], @board[2][0]]
    diagonal1.all? { |c| c == 'X' } ||
      diagonal1.all? { |c| c == 'O' } ||
      diagonal2.all? { |c| c == 'X' } ||
      diagonal2.all? { |c| c == 'O' }
  end

end
