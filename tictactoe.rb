class Player 
  attr_accessor :name , :figure
    
  def name
    @name = gets.chomp.capitalize
  end
    
  def figure
    @figure
  end
    
  def get_figure
    @figure
  end
    
  def get_name
    @name
  end
end

class Board
  attr_accessor :cell

  $cell = Array(1..9)

  def cell
    $cell
  end

  def display_board
    puts " #{$cell[0]} | #{$cell[1]} | #{$cell[2]} "
    puts "---+---+---"
    puts " #{$cell[3]} | #{$cell[4]} | #{$cell[5]} "
    puts "---+---+---"
    puts " #{$cell[6]} | #{$cell[7]} | #{$cell[8]} "
    puts "\n"    
  end

  def current_player(p1, p2)
    @player1 = p1
    @player2 = p2
    $cur_player = @player1
  end

  def board_change(change)
    $cell[change.to_i-1] = $cur_player.figure
    player = $cur_player
    if check_for_winner($cell, player)
      puts "#{$cur_player.get_name} WINS!"
      new_game
    elsif !check_for_draw($cell)
      puts "It is a DRAW"
      new_game
    else
      $cur_player = $cur_player == @player1 ? @player2 : @player1
      move
    end
  end

  def move 
    display_board
    change = gets.chomp
    @player == $cur_player
    board_change(change)
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
        count +=1 if cell[position - 1] == player.figure
      }
      win = true if count == 3
    }
    win
  end

  def check_for_draw(board)
    board.any? (Integer)
  end

  def new_game
    puts "Do yuo want to play new game? Y/N"
    answer = gets.chomp.capitalize
    if answer == 'Y' then Game.new end
  end
end

  
class Game
  def initialize
    @player1 = Player.new
    puts 'Please enter the name of the Player One'
    @player1.name
    @player2 = Player.new
    puts 'Please enter the name of the Player Two'
    @player2.name
    puts "#{@player1.get_name} please select sign X or O"
    @player1.figure = gets.chomp.upcase
    @player2.figure = @player1.figure == 'X' ? 'O' : 'X'
    puts "#{@player1.get_name}'s figure is #{@player1.get_figure}, #{@player2.get_name}'s figure is #{@player2.get_figure}"
    puts
    puts "#{@player1.get_name} plays first, please select number on the board:"
    puts
    @board = Board.new
    @board.current_player(@player1, @player2)
    @board.move
  end
 
end
Game.new