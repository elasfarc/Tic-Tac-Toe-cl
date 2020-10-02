class Board
    attr_accessor :board

    def initialize
        first_row = %w[_ _ _]
        second_row = %w[_ _ _]
        third_row = %w[_ _ _]
        @board = [first_row, second_row, third_row]
    end

     def p_board
       
       "#{@board[0][0]} #{@board[0][1]} #{@board[0][2]}\n" +
       "#{@board[1][0]} #{@board[1][1]} #{@board[1][2]}\n" +
       "#{@board[2][0]} #{@board[2][1]} #{@board[2][2]}"
     end

     def check_input(input)
      if wrong_input?(input)
        "wrong"
      elsif already_taken?(input)
        "taken"
      else
        "accepted"
      end
     end

     def wrong_input?(input)
        mapping(input) == nil 
     end

    def already_taken?(input)
        mapping_array = mapping(input)
        # function 
     @board[ mapping_array[0]][ mapping_array[1] ] != '_'
        
    end

    def modify(current_player, input)
       letter = round(current_player)

      mapping_array = mapping(input)
      # function 
   @board[mapping_array[0]][mapping_array[1]] = letter
      
  end

  def round(current_player_local)
    letter = if current_player_local
  
               'X'
             else
               'O'
             end
    letter
  end

    def mapping(move)
        move = move.to_sym
        board_hash = { A1: [0, 0], A2: [0, 1], A3: [0, 2],
                       B1: [1, 0], B2: [1, 1], B3: [1, 2],
                       C1: [2, 0], C2: [2, 1], C3: [2, 2] }
        board_hash[move]
    end
end

#board1 = Board.new
#puts board1.print_board