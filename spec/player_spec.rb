require_relative '../lib/player.rb'

RSpec.describe Player do
  subject { Player.new }

  describe '#valid_name?' do
    context 'Invalid player name' do
      context 'player name is an empty string' do
        it 'returns false' do
          player_name = ''
          expect(subject.valid_name?(player_name)).to eq(false)
        end
      end

      context 'player name is a space' do
        it 'returns false' do
          player_name = ' '
          expect(subject.valid_name?(player_name)).to eq(false)
        end
      end

      context 'player name is a number' do
        it 'returns false' do
          player_name = '4545'
          expect(subject.valid_name?(player_name)).to eq(false)
        end
      end

      context 'player name is starting with ZERO' do
        it 'returns false' do
          player_name = '0player'
          expect(subject.valid_name?(player_name)).to eq(false)
        end
      end
    end

    context 'valid player name ' do
      it 'returns true' do
        player_name = 'player'
        expect(subject.valid_name?(player_name)).to eq(true)
      end
    end
  end
end
