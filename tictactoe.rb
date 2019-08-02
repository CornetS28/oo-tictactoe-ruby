class Board
    attr_accessor :cell

    $cell = Array(1..9)

    def initialize()
      reset
    end
    
  
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

  
    def player_move(player, move, cell)
      if $cell[move - 1] != @figure
        cell[move - 1] = player.figure

        $new_board.check_for_winner($celboardlayer)
        if $new_board.check_for_winner($cell, player)
          puts "#{player.name} WINS!"
        end
      end
       $turn_count += 1
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
  
  end

  class Player 
    attr_accessor :name , :figure
  
    def name=(name)
      @name = name
    end
  
    def figure=(figure)
      @figure = figure
    end
  
    def figure
      @figure
    end
  
    def name
      @name
    end
  
end
Board.new.display_board