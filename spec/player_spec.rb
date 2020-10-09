require_relative '../lib/player.rb'

RSpec.describe Player do
  subject { Player.new }

  describe '#valid_name?' do
    it 'player name is not an empty string' do
      player_name = ''
      expect(subject.valid_name?(player_name)).to eq(false)
    end

    it 'player name is not a space' do
      player_name = ' '
      expect(subject.valid_name?(player_name)).to eq(false)
    end

    it 'player name is not a number' do
      player_name = '4545'
      expect(subject.valid_name?(player_name)).to eq(false)
    end

    it 'player name is not starting with ZERO' do
      player_name = '0player'
      expect(subject.valid_name?(player_name)).to eq(false)
    end

    it 'player name is a valid name' do
      player_name = 'player'
      expect(subject.valid_name?(player_name)).to eq(true)
    end
  end
end
