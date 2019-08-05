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

end
