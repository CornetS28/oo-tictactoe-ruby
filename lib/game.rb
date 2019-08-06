
require_relative './player.rb'
require_relative './board.rb'

class Game
  def initialize(p1, p2)
    @board = Board.new
    @player1 = p1
    @player2 = p2
    @board.display_board
    $cur_player = @player1
  end
  def board_change(move)
    $cell[move.to_i-1] = $cur_player.get_figure
    player = $cur_player
    if check_for_winner($cell, player)
      @board.display_board
      
      $result = 'win'
    elsif !check_for_draw($cell)
      @board.display_board
      $result = 'draw'
    else
      $cur_player = $cur_player == @player1 ? @player2 : @player1
      @board.display_board
      $result = false
    end
  end
  def check_for_winner(cell,player)
    winning_combinations = [
      [1,2,3],[4,5,6],[7,8,9],
      [1,4,7],[2,5,8],[3,6,9],
      [1,5,9],[3,5,7]
    ]
    win = false
    winning_combinations .each {|conbo|
      count = 0
      conbo.each {|position|
        count += 1 if cell[position - 1] == player.figure
      }
      win = true if count == 3
    }
    win
  end
  def check_for_draw(board)
    board.any? (Integer)
  end
  def check 
    $result = false
  end
 
end
