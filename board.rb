class GameBoard
  attr_accessor :board, :visual_board
  HORIZONTAL_LINES = "---------"
  
  def initialize
    @board = []
    @visual_board = []
  end
  
  def display
    first_row = "#{@visual_board[6]} | #{@visual_board[7]} | #{@visual_board[8]}"
    second_row = "#{@visual_board[3]} | #{@visual_board[4]} | #{@visual_board[5]}"
    third_row = "#{@visual_board[0]} | #{@visual_board[1]} | #{@visual_board[2]}"
    puts first_row
    puts HORIZONTAL_LINES
    puts second_row
    puts HORIZONTAL_LINES
    puts third_row
  end

  def new_game
    @board = []
    @visual_board = []
  end

  def board_full?() #returns true if the board is full
    if @visual_board.any?(" ")
      return false
    else
      return true
    end
  end

end