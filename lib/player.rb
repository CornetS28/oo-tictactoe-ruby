class Player 
  attr_accessor :name , :figure

  def name=(name)
    @name = name
  end

  def figure=(figure)
    @figure = figure
  end

  def get_figure
    @figure
  end

  def get_name
    @name
  end

end