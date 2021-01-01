class Player
  attr_reader :icon
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

  def winner?(last_play) #We can check for a win by passing the same variable as before
    possibilities = []
    if(@spaces.length < 3)
      return false
    else
      WIN_CONDITIONS.each do |array|
        if array.include?(last_play)
          possibilities.push(array)
        end
      end
      possibilities.each do |win_condition|
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