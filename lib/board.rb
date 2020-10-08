class Board
  attr_accessor :board

  def initialize
    first_row = %w[_ _ _]
    second_row = %w[_ _ _]
    third_row = %w[_ _ _]
    @board = [first_row, second_row, third_row]
  end

  def p_board
    "| #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} |\n" \
    "--------------\n" \
      "| #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} |\n" \
    "--------------\n" \
      "| #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} |\n"
  end

  def check_input(input)
    if wrong_input?(input)
      'wrong'
    elsif already_taken?(input)
      'taken'
    else
      'accepted'
    end
  end

  def modify(current_player, input)
    letter = round(current_player)

    mapping_array = mapping(input)

    @board[mapping_array[0]][mapping_array[1]] = letter
  end

  def game_finish?(current_player, input)
    return 'winner' if winner?(current_player, input)
    return 'draw' if draw?

    false
  end

  private

  def wrong_input?(input)
    mapping(input).nil?
  end

  def already_taken?(input)
    mapping_array = mapping(input)

    @board[mapping_array[0]][ mapping_array[1] ] != '_'
  end

  def mapping(move)
    move = move.to_sym
    board_hash = { A1: [0, 0], A2: [0, 1], A3: [0, 2],
                   B1: [1, 0], B2: [1, 1], B3: [1, 2],
                   C1: [2, 0], C2: [2, 1], C3: [2, 2] }
    board_hash[move]
  end

  def round(current_player_local)
    letter = if current_player_local

               'X'
             else
               'O'
             end
    letter
  end

  def draw?
    flag = []
    flag[0] = @board[0].none? { |cell| cell == '_' }
    flag[1] = @board[1].none? { |cell| cell == '_' }
    flag[2] = @board[2].none? { |cell| cell == '_' }

    flag.all? { |f| f == true }
  end

  def winner?(current_player, input)
    arr = mapping(input)
    return true if horizontal_match?(arr) || vertical_match?(arr)

    if arr[0] == arr[1] || (arr[0] - arr[1]).abs == 2
      letter = round(current_player)
      return true if diagonal_check(letter)
    end

    false
  end

  def horizontal_match?(ary)
    (@board[ary[0]][0] == @board[ary[0]][1]) && (@board[ary[0]][1] == @board[ary[0]][2])
  end

  def vertical_match?(ary)
    (@board[0][ary[1]] == @board[1][ary[1]]) && (@board[1][ary[1]] == @board[2][ary[1]])
  end

  def diagonal_check(letter)
    ((@board[0][0] == letter) && (@board[1][1] == letter) && (@board[2][2] == letter)) ||
      ((@board[0][2] == letter) && (@board[1][1] == letter) && (@board[2][0] == letter))
  end
end
