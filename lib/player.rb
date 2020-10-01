class Player
    @@players_arry = []
    
    attr_accessor :name

    def initialize(n = "unknown_player")
        @name = n
        @@players_arry.push(@name)
    end

    # def print_players
    #     @@players_arry
    # end
end



# pp "enter ur name"
#   p1 = Player.new(gets.chomp)
# pp "enter ur  2nd name"
#   p2 = Player.new(gets.chomp)
#   p2_name = p2.name

#  #pp p1_name

#  pp p1.print_players
 
