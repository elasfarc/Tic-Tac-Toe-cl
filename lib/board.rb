class Board
    attr_accessor :board

    def initialize
        first_row = %w[_ _ _]
        second_row = %w[_ _ _]
        third_row = %w[_ _ _]
        @board = [first_row, second_row, third_row]
    end

    # def board_matrix
    #     puts "#{@board[0][0]} #{@board[0][1]} #{@board[0][2]}"
    #     puts "#{@board[1][0]} #{@board[1][1]} #{@board[1][2]}"
    #     puts "#{@board[2][0]} #{@board[2][1]} #{@board[2][2]}"
        
    # end
end

