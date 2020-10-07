require_relative '../lib/game.rb'

RSpec.describe Game do
    let(:game) { Game.new()}
    let(:player_one) {double('player one object',name: 'Recardo')}
    describe '#player_two_is_the_same_as_player_one?' do

        it 'ensures that name of player two is not the same as player one name  ' do
            game.players_arry = [player_one]

            expect(game.player_two_is_the_same_as_player_one?('Recardo')).to eq(true)
        end
    end
end


#game.player_two_is_the_same_as_player_one?(player_two_name)



# RSpec.describe Game do
#     let(:game) { Game.new()}
#     let(:player_one) {double("player one object"), name: 'Recardo'}
#     it 'jhjhjh' do
#     game.players_arry = [player_one]

#     expect(game.players_arry[0]).to eq('Recardo') 
#     end     
      
    
# end