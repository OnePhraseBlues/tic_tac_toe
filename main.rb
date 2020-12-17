class GameBoard

=begin
Under the hood, the game board will be an array of 9 booleans.
True will represent X. False will represent O. nil will represent available space.
Not exactly sure how testing for nil works but we're about to find out!
=end

  def initialize
    @board = []
    9.times do
      @board.push(nil)
    end
  end
  
  def display(board_array)
    first_row = "#{board_array[0]} / #{board_array[1]} / #{board_array[2]}"
    second_row = "#{board_array[3]} / #{board_array[4]} / #{board_array[5]}"
    third_row = "#{board_array[6]} / #{board_array[7]} / #{board_array[8]}"
    puts first_row
    puts second_row
    puts third_row
  end


  def fill_space(player_move) #player_move will likely be a hash containing the player and the space
    case player_move["space"]
    when 7
      @board[0] = player_move["play"]
    when 8
      @board[1] = player_move["play"]
    when 9
      @board[2] = player_move["play"]
    when 4
      @board[3] = player_move["play"]
    when 5
      @board[4] = player_move["play"]
    when 6
      @board[5] = player_move["play"]
    when 1
      @board[6] = player_move["play"]
    when 2
      @board[7] = player_move["play"]
    when 3
      @board[8] = player_move["play"]
    end
  end

