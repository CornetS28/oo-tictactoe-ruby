require './lib/player.rb'

describe Player do
  pl = Player.new
  pl.name = 'Emir'
  pl.figure = 'X'
  it 'sets the name for player' do
    expect(pl.get_name).to eql('Emir')
  end
  
  it 'returns wrhog name' do  
    expect(pl.get_name).not_to eql('Samuel')
  end

  it 'sets figure for player figure' do
    expect(pl.get_figure).to eql('X')  
  end
  
  it 'return wrong figure' do
    expect(pl.get_name).not_to eql('O')
  end
  
end

