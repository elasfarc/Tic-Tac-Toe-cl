require_relative '../lib/game.rb'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player_one) { double('player one object', name: 'Recardo') }
  let(:player_two) { double('player two object', name: 'Ted') }
  describe '#player_two_is_the_same_as_player_one?' do
    it 'ensures that name of player two is not the same as player one name  ' do
      game.players_arry = [player_one]

      expect(game.player_two_is_the_same_as_player_one?('Recardo')).to eq(true)
      expect(game.player_two_is_the_same_as_player_one?('Ted')).to_not eq(true)
    end
  end

  describe '#switch_player' do
    context 'current player is true' do
      it 'changes current_player to false' do
        expect(game.switch_player).to eq(false)
      end
    end
    context 'current player is false' do
      it 'changes current_player to true' do
        game.current_player = false
        expect(game.switch_player).to eq(true)
      end
    end
  end

  describe '#whos_turn?' do
    context 'current player is true' do
      it 'return player one name' do
        game.players_arry = [player_one, player_two]
        expect(game.whos_turn?).to eq('Recardo')
      end
    end
    context 'current player is false' do
      it 'return player two name' do
        game.players_arry = [player_one, player_two]
        game.current_player = false
        expect(game.whos_turn?).to eq('Ted')
      end
    end
  end

  describe '#play_again?' do
    context 'the user input passed to it is "y"' do
      it 'returns true' do
        user_input = 'y'
        expect(game.play_again?(user_input)).to eq(true)
      end
    end
    context 'the user input passed to it different than "y"' do
      it 'returns false' do
        user_input = 'n'
        expect(game.play_again?(user_input)).to eq(false)
      end
    end
  end

  describe '#reset' do
    it 'reset game object\'s variable [@players_arry] to default' do
      game.players_arry = [player_one, player_two]
      game.reset
      expect(game.players_arry).to match_array []
    end

    it 'reset game object\'s variable [@current_player] to default' do
      game.current_player = true
      game.reset
      expect(game.current_player).to eq(true)
      game.current_player = false
      game.reset
      expect(game.current_player).to eq(true)
    end
  end
end
