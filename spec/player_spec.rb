require './lib/player.rb'

describe Player do
  it 'sets the name for player' do
    pl = Player.new
    pl.name = 'Emir'
    expect(pl.get_name).to eql('Emir')
  end

  it 'sets figure for player figure' do
    pl = Player.new
    pl.figure = 'X'
    expect(pl.get_figure).to eql('X')  

  end
  
end

