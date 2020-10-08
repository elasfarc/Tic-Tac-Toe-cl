require '../lib/board'

RSpec.describe Board do
  let(:board){Board.new}
  let(:input){""}
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
end



