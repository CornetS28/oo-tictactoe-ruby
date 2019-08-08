
require './lib/game.rb'


describe Game do
  player1 = Player.new
  player1.name = 'Emir'
  player1.figure = 'X'
  player2 = Player.new
  player2.name = 'Samuel'
  player2.figure = 'O'
  game = Game.new(player1, player2)
  
  describe '#initialize' do
    it 'initializes it' do
      expect(player1.get_name).to eql('Emir')
    end
    
    it 'doesnt return the name' do
      expect(player1.get_name).not_to eql('')
    end
  end

  describe '#board_change' do
    it 'checks for board change' do
      game.board_change(2)
     
      expect($cell).to eql([1,'X',3,4,5,6,7,8,9])
    end
    
    it 'desnt change the board' do
      expect($cell).not_to eql([1,2,3,4,5,6,7,8,9])
    end
  end



  describe '#check_for_winner' do
    it 'defines a constant WIN_COMBINATIONS with arrays for each win combination' do
      expect($winning_combinations.length).to eq(8)

      expect($winning_combinations).to include([1,2,3])
      expect($winning_combinations).to include([4,5,6])
      expect($winning_combinations).to include([7,8,9])
      expect($winning_combinations).to include([1,4,7])
      expect($winning_combinations).to include([2,5,8])
      expect($winning_combinations).to include([3,6,9])
      expect($winning_combinations).to include([1,5,9])
      expect($winning_combinations).to include([3,5,7])
    end
    
    it 'defines a wrong constant WIN_COMBINATIONS with arrays for each win combination' do
      expect($winning_combinations).not_to include([1,7,9])
    end

    let(:numbers) { [4,5,6,7,8,9] } 
    it 'returns true if winner' do
      win_board = ['X', 'X', 'X', numbers]
    
      expect(game.check_for_winner(win_board, player1)).to eql(true)
    end
    
    it 'it returns false when winner' do
      win_board = ['X', 'X', 'X', numbers]
      expect(game.check_for_winner(win_board, player1)).not_to eql(false)
    end

    it 'returns false if no winner' do
      win_board = ['X', 'X', 'O', numbers]
    
      expect(game.check_for_winner(win_board, player1)).to eql(false)
    end
    
    it 'returns winner when false' do
      win_board = ['X', 'X', 'O', numbers]
      expect(game.check_for_winner(win_board, player1)).not_to eql(true)
    end

  end

  describe '#check_for_draw' do
    it 'checks for draw' do 
      draw_board = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
      expect(game.check_for_draw(draw_board)).to eql(false)
    end
    
    it 'doesnt check for draw' do
      draw_board = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X', 'O']
      expect(game.check_for_draw(draw_board)).not_to eql(true)
    end
  end
end
