class Game
  attr_accessor :players_arry

  def initialize()
    @current_player = true
  end

  def player_two_is_the_same_as_player_one?(player_two_name)
    player_two_name == @players_arry[0].name
  end

  def switch_player
    @current_player = !@current_player
  end

  attr_reader :current_player

  def whos_turn?
    if current_player
      @players_arry[0].name
    else
      @players_arry[1].name
    end
  end

  def play_again?(arg)
    arg == 'y'
  end

  def reset
    @players_arry = []
    @current_player = true
  end
end
