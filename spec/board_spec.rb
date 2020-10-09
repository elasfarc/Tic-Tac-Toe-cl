require_relative '../lib/board.rb'

RSpec.describe Board do
  let(:board) { Board.new }
  let(:input) { 'A1' }
  let(:game) { double('game object with current player true', current_player: true) }
  let(:game2) { double('game object with current player false', current_player: false) }
  describe '#p_board' do
    it 'returns the board' do
      expect(board.p_board).to eq("| #{board.board[0][0]} | #{board.board[0][1]} | #{board.board[0][2]} |\n" \
      "--------------\n" \
        "| #{board.board[1][0]} | #{board.board[1][1]} | #{board.board[1][2]} |\n" \
      "--------------\n" \
        "| #{board.board[2][0]} | #{board.board[2][1]} | #{board.board[2][2]} |\n")

      expect(board.p_board).to_not eq("| #{board.board[0][0]} | #{board.board[0][1]} | #{board.board[0][2]} |\n" \
        "--------------\n" \
          "| #{board.board[1][0]} | #{board.board[1][1]} | #{board.board[1][2]} |\n" \
        "-------------------------------------------------------------\n" \
          "| #{board.board[2][0]} | #{board.board[2][1]} | #{board.board[2][2]} |\n")
    end
  end

  describe '#check_input' do

    context 'Invalid user Input !( A : C -> 1 : 3 )' do
      it 'return wrong' do
        input = 'd'
        expect(board.check_input(input)).to eq('wrong')
        input = 'A1'
        expect(board.check_input(input)).to_not eq('wrong')
      end
    end

    context 'valid user Input' do
      context 'the cell that the user choosed is not empty' do
        it 'returns taken' do
          board.board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
          expect(board.check_input(input)).to_not eq('taken')
          board.board = [%w[x _ _], %w[_ _ _], %w[_ _ _]]
          expect(board.check_input(input)).to eq('taken')
        end
      end

      context 'the user input is valid ( A : C -> 1 : 3 ) && not taken by another move' do
        it 'return accepted' do
          expect(board.check_input(input)).to eq 'accepted'
          expect(board.check_input(input)).to_not eq 'good'
        end
      end


    end
  end

  describe '#modify' do
    context 'current player is player one' do
      it 'write X to the correspond cell' do
        board.modify(game.current_player, input)
        expect(board.board[0][0]).to eq('X')
        expect(board.board[0][0]).to_not eq('O')
      end
    end
    context 'current player is player two' do
      it 'write O to the correspond cell' do
        board.modify(game2.current_player, input)
        expect(board.board[0][0]).to eq('O')
        expect(board.board[0][0]).to_not eq('X')
      end
    end
  end

  describe '#game_finish?' do
    it 'returns false if there is no winner and its not a draw' do
      board.board = [%w[x _ _], %w[_ _ _], %w[_ _ _]]
      expect(board.game_finish?(game.current_player, input)).to eq(false)
    end

    describe 'with winner' do
      context 'horizontal match' do
        it 'returns "winner" ' do
          board.board = [%w[x x x], %w[_ _ _], %w[_ _ _]]
          expect(board.game_finish?(game.current_player, input)).to eq('winner')
          board.board = [%w[X _ X], %w[O O X], %w[_ _ _]]
          expect(board.game_finish?(game.current_player, input)).to_not eq('winner')
        end
      end

      context 'vertical match' do
        it 'returns "winner" ' do
          board.board = [%w[x y y], %w[x _ _], %w[x _ _]]
          expect(board.game_finish?(game.current_player, input)).to eq('winner')
          board.board = [%w[x y y], %w[x _ _], %w[o _ _]]
          expect(board.game_finish?(game.current_player, input)).to_not eq('winner')
        end
      end

      context 'Diagonal match' do
        context 'down diagonal (input ->A1,B2,C3)' do
          it 'returns "winner" ' do
            board.board = [%w[X y y], %w[y X _], %w[_ _ X]]
            expect(board.game_finish?(game.current_player, input)).to eq('winner')
            board.board = [%w[X O O], %w[O X _], %w[_ _ O]]
            expect(board.game_finish?(game.current_player, input)).to_not eq('winner')
          end
        end
        context 'up diagonal (input-> C1,A3)' do
          it 'returns "winner"' do
            input = 'C1'
            board.board = [%w[_ _ O], %w[_ O _], %w[O _ x]]
            expect(board.game_finish?(game2.current_player, input)).to eq('winner')
            board.board = [%w[_ _ O], %w[_ O _], %w[X _ X]]
            expect(board.game_finish?(game2.current_player, input)).to_not eq('winner')
          end
        end
      end
    end

    context 'all cells are occupied without a winner' do
      it 'returns "draw"' do
        board.board = [%w[X O X], %w[X O O], %w[O X X]]
        expect(board.game_finish?(game2.current_player, input)).to eq('draw')

        board.board = [%w[X O X], %w[_ O O], %w[O _ X]]
        expect(board.game_finish?(game2.current_player, input)).to_not eq('draw')
      end
    end
  end
end
