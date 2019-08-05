require_relative '../config/environment'

input = ""
until input == "exit"
  system "cls" or system "clear"
  puts "Welcome to Samuel's & Emir's Tic-tac-toe Game"

  puts "What Would You Like To Do:", "1. Player vs Player","2. Exit"

  kind = gets.strip.to_i

  case kind

  when 1
    system "cls" or system "clear"
    game = Game.new
    game.play
  when 2
    input = "exit"
  end
  break if input == "exit"
  puts "\n","Do you want to re-play? (y/n)"
  input = gets.strip.downcase
  input = "exit" if input == "n" or input == "no"
end
puts "Good Bye!!"