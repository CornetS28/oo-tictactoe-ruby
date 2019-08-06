require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'
class Main
  def initialize
    @player1 = Player.new
    puts 'Please enter the name of the Player One'
    @player1.name = gets.chomp.capitalize
    @player2 = Player.new
    puts 'Please enter the name of the Player Two'
    @player2.name = gets.chomp.capitalize
    puts "#{@player1.get_name} please select sign X or O"
    @player1.figure = gets.chomp.upcase
    @player2.figure = @player1.figure == 'X' ? 'O' : 'X'
    puts "#{@player1.get_name}'s figure is #{@player1.get_figure}, #{@player2.get_name}'s figure is #{@player2.get_figure}"
    puts
    puts "#{@player1.get_name} plays first, please select number on the board:"
    puts
    @game = Game.new(@player1, @player2)
    new_move
  end
  def new_move
    move = gets.chomp
    @game.board_change(move)
    result
  end
  def result 
    if $result == false
      new_move
    elsif $result == "draw"
      puts "It is a DRAW"
      new_game
    else 
      puts "#{$cur_player.get_name} WINS!"
      new_game
    end
  end
  def new_game
    puts 'Do you want to play new game. Please answer Y for yws or N for no'
    answer = gets.chomp.capitalize
    if answer == 'Y'
      Main.new
    else answer == 'N'
      puts 'Thank you for playing'
    end
  end
end
Main.new