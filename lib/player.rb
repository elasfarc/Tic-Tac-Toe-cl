class Player
    @@players_arry = []
    @@current_player = true
    attr_accessor :name

    def initialize(n = "unknown_player")
        @name = n
        @@players_arry.push(@name)
    end

    def switch_player
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



# pp "enter ur name"
   #p1 = Player.new(gets.chomp)
   #pp p1.switch_player
   #pp p1.whos_turn?
   #pp Player.whos_turn?
# pp "enter ur  2nd name"
#   p2 = Player.new(gets.chomp)
#   p2_name = p2.name

#  #pp p1_name

#  pp p1.print_players



 
