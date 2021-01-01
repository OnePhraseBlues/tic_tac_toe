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
