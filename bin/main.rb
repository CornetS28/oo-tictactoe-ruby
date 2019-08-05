require './lib/player.rb'
require './lib/board.rb'
class Main

  def initialize
    @player1 = Player.new
    puts 'Please enter the name of the Player One'
    @player1.name = gets.chop
    @player2 = Player.new
    puts 'Please enter the name of the Player Two'
    @player2.name = gets.chomp
    puts "#{@player1.get_name} please select sign X or O"
    @player1.figure = gets.chomp.upcase
    @player2.figure = @player1.figure == 'X' ? 'O' : 'X'
    puts "#{@player1.get_name}'s figure is #{@player1.get_figure}, #{@player2.get_name}'s figure is #{@player2.get_figure}"
    puts
    puts "#{@player1.get_name} plays first, please select number on the board:"
    puts
    @board = Board.new
    @board.display_board
    
  end

end

Main.new