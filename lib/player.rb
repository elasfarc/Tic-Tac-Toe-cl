class Player
  attr_accessor :name
  def initialize(); end  
  
  def valid_name?(player_name)
    player_name != '' && player_name != ' ' && player_name.to_i.zero? &&
      ((player_name =~ /0/) != 0)
  end

end

#p1 = Player.new
#p1.name= 'mo'
#pp p1.name           