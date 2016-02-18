require 'rails_helper'

RSpec.describe Fight, type: :model do

  describe 'associations' do
    it { should belong_to :looser }
    it { should belong_to :winner }
  end

  describe 'db columns' do
    it { should have_db_column :pokemon_id }
    it { should have_db_column :competitor_id }
  end
  describe 'initialization and choosing for winner' do #TO DO
  #   let(:pokemon){create(:pokemon)}
  #   let(:pokemon1){create(:pokemon1)}
  #   it 'chooses winner' do
  #     fight = Fight.new(pokemon_id: pokemon.id, competitor_id: pokemon1.id)
  #     fight.find_winner
  #     fight.save
  #     expect(Fight.last.winner).to eq(pokemon1)
  #     expect(Fight.last.looser).to eq(pokemon)
  #     # expect(pokemon1.experience).to eq(50)
  #     # expect(pokemon.experience).to eq(25)
  #   end
  end

end
