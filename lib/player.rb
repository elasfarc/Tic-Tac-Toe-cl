class Player
  @@players_arry = []
  @@current_player = true
  attr_accessor :name

  def initialize(n = 'unknown_player')
    @name = n
    @@players_arry.push(@name)
  end

  def self.switch_player
    @@current_player = !@@current_player
  end

  def self.current_player
    @@current_player
  end

  def self.whos_turn?
    if current_player
      "okay #{@@players_arry[0]} it's ur turn "
    else
      "okay #{@@players_arry[1]} it's ur turn "
    end
  end
end
