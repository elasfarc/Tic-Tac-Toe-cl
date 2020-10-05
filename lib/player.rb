# rubocop:disable Style/ClassVars
class Player
  @@players_arry = []
  @@current_player = true
  attr_reader :name

  def initialize(name = 'unknown_player')
    @name = name
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

  def self.naming
    if @@current_player
      @@players_arry[0]
    else
      @@players_arry[1]
    end
  end

  def self.play_again?(arg)
    arg == 'y'
  end

  def self.valid_name?(player_name)
    player_name != '' && player_name != ' ' && player_name.to_i.zero? &&
      ((player_name =~ /0/) != 0)
  end

  def self.reset
    @@players_arry = []
    @@current_player = true
  end
end
# rubocop:enable Style/ClassVars
