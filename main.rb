class GameBoard

=begin
Under the hood, the game board will be a hash with 9 keys. If the key exists, the logic 
will determine that the move is illegal. Still need to figure out a way to test for the
win condition
=end

  def initialize
    @board = {}
  end
  
  def display(board_array)
    #we can still take an array as input but contain whitespace strings if vacant
    first_row = "#{board_array[0]} / #{board_array[1]} / #{board_array[2]}"
    second_row = "#{board_array[3]} / #{board_array[4]} / #{board_array[5]}"
    third_row = "#{board_array[6]} / #{board_array[7]} / #{board_array[8]}"
    puts first_row
    puts second_row
    puts third_row
  end

  def fill_space(player_move) #player_move will likely be a hash containing the player and the space
    @board[player_move.keys[0]] = player_move["play"]
  end

  def win_test
    if()