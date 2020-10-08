require_relative '../lib/board.rb'

RSpec.describe Board do
  let(:board){Board.new}
  let(:input){""}
  let(:game) {double('game object with current player true', current_player: true )}
  let(:game2) {double('game object with current player false', current_player: false  )}
  describe '#p_board' do
    it 'prints the board' do
      expect(board.p_board).to eq( "| #{board.board[0][0]} | #{board.board[0][1]} | #{board.board[0][2]} |\n" \
      "--------------\n" \
        "| #{board.board[1][0]} | #{board.board[1][1]} | #{board.board[1][2]} |\n" \
      "--------------\n" \
        "| #{board.board[2][0]} | #{board.board[2][1]} | #{board.board[2][2]} |\n")
    end
  end

  describe '#check_input' do
    it "return wrong if not a valid input !( A : C -> 1 : 3 )" do
      input = "d"
      expect(board.check_input(input)).to eq('wrong')
    end

    it 'return taken if the input is not "_"' do
      board.board = [["x", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
      input = "A1"
      expect(board.check_input(input)).to eq("taken")
    end

    it 'return accepted if it is in range ( A : C -> 1 : 3 )' do
      input = "A1"
      expect(board.check_input(input)).to eq ('accepted')
    end
  end

  describe '#modify' do
    
    it 'wirte the player choosen board\'s cell  to X if current player is player one  ' do
      input = 'A1'
      board.modify(game.current_player, input)
      expect(board.board[0][0]).to eq('X')
    end

    it 'wirte the player choosen board\'s cell  to "O" if current player is player two  ' do
      input = 'A1'
      board.modify(game2.current_player, input)
      expect(board.board[0][0]).to eq('O')
    end

  end

  describe '#game_finish?' do
    it 'returns false if there is no winner and its not a draw' do
      input = 'A1'
      board.board = [["x", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
      expect(board.game_finish?(game.current_player, input)).to eq(false)
    end

    it 'returns "winner" if there is a horizontal match ' do 
      input = "A1"
      board.board = [["x", "x", "x"], ["_", "_", "_"], ["_", "_", "_"]]
      expect(board.game_finish?(game.current_player, input)).to eq('winner')
    end

    it 'returns "winner" if there is a vertical match ' do 
      input = "A1"
      board.board = [["x", "y", "y"], ["x", "_", "_"], ["x", "_", "_"]]
      expect(board.game_finish?(game.current_player, input)).to eq('winner')
    end

    it 'returns "winner" if there is a diagonal match 
        if and only if user input (down diagonal -> A1,B2,C3)' do
          input = "A1"
          board.board = [["X", "y", "y"], ["y", "X", "_"], ["_", "_", "X"]]
          expect(board.game_finish?(game.current_player, input)).to eq('winner')
    end 

    it 'returns "winner" if there is a diagonal match 
    if and only if user input (up diagonal -> C1,A3)' do
      input = "C1"
      board.board = [["_", "_", "O"], ["_", "O", "_"], ["O", "_", "x"]]
      expect(board.game_finish?(game2.current_player, input)).to eq('winner')
      
    end 

    it 'returns "draw" if all cells are occupied without a winner' do 
      input = "A1"
      board.board = [["X", "O", "X"], ["X", "O", "O"], ["O", "X", "X"]]
      expect(board.game_finish?(game2.current_player, input)).to eq('draw')
    end

  end

end



