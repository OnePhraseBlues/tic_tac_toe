class GameBoard
  attr_accessor :board, :visual_board
  HORIZONTAL_LINES = "---------"
  
  def initialize
    @board = []
    @visual_board = []
  end
  
  def board_state
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

class GameCell
  attr_accessor :cell

  def initialize
    @cell = " "
  end

  def legal_move?(player)
    unless @cell == " "
      return false
    else
      @cell = player
      return true
    end
  end

  def clear_cell
    @cell = " "
  end
end

class Player
  attr_reader :icon, :spaces
  attr_accessor :wins, :losses, :ties
  @@players = 0
  WIN_CONDITIONS = [[1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9],
                      [1, 4, 7],
                      [2, 5, 8],
                      [3, 6, 9],
                      [1, 5, 9],
                      [3, 5, 7]]

  def initialize
    if(@@players % 2 == 0)
      @icon = "X"
      @@players += 1
    else
      @icon = "O"
      @@players += 1
    end

    @wins = 0
    @losses = 0
    @ties = 0
    @spaces = []
  end

  def play_space(game_cell) #GameCell class will need to check if the move is legal
    @spaces.push(game_cell)
    @spaces.sort!
  end

  def winner?
    if(@spaces.length < 3)
      return false
    else
      WIN_CONDITIONS.each do |win_condition|
        if win_condition.all? {|cell| @spaces.include?(cell)}
          return true
        else
          next
        end
      end
      return false
    end
  end
end

puts "Tic Tac Toe! 3 in a row! Player 1 is X and Player 2 is O"
current_game = GameBoard.new()
player_x = Player.new()
player_o = Player.new()
players = [player_x, player_o]
9.times do |loop_count|
  game_space = GameCell.new()
  current_game.board[loop_count] = game_space
  current_game.visual_board[loop_count] = game_space.cell
end

P1_PROMPT = "Player 1: make your move (visualize the numpad as the game board)"
P2_PROMPT = "Player 2: make your move (visualize the numpad as the game board)"
OUT_OF_BOUNDS = "Invalid entry. Please try again."
INVALID_MOVE = "That space is taken! Please try again."

turn_counter = 0
loop do #loop runs until we have a winner
  current_game.board_state
  #this variable will keep track of which player is making a move by acting as the index
  active_player = turn_counter % 2
  case active_player
  when 0
    puts P1_PROMPT
  when 1
    puts P2_PROMPT
  end
  
  loop do #looping for proper user input
    turn = gets.to_i
    case turn
    when 1..9
      #lining up with GameBoard indices
      turn -= 1
      #super complicated statement but here goes: the GameBoard object is an array containing nine GameCell objects. GameCell has a method to check if the space is vacant. If it isn't, logic will go to the else statement and the loop will continue to prompt for proper input. If it is vacant, the legal_move method will also update the cell contents with the Player object icon so that it is no longer vacant.
      if current_game.board[turn].legal_move?(players[active_player].icon)
        legal_move = true
        current_game.visual_board[turn] = current_game.board[turn].cell
      else
        legal_move = false
        puts INVALID_MOVE
      end
    else
      puts OUT_OF_BOUNDS
      legal_move = false
    end
    if legal_move
      #lining back up with win condition spaces (this was the bug)
      turn += 1
      players[active_player].play_space(turn)
      break
    end
  end

  if players[active_player].winner?
    current_game.board_state
    puts "We have a winner! Congratulations #{players[active_player].icon}!"
    break
  elsif current_game.board_full?
    current_game.board_state
    puts "Cat's Scratch!"
    break
  else
    turn_counter += 1
    next
  end
end