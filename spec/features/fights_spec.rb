require "rails_helper"

describe  'adding fights' do
  let(:pokemon){create(:pokemon)}
  let(:pokemon1){create{:pokemon1}}
  it 'is possible' do
    visit new_fight_path
    print page.html
    find('#fight_pokemon_id').find(:xpath, 'option[1]').select_option
    find('#fight_competitor_id').find(:xpath, 'option[2]').select_option
    click_button 'FIGHT!'
    expect(page).to have_content Pokemon.last.full_name + ' won'
    expect(pokemon.fights_lost).to eq(1)
    expect(pokemon1.fights_won).to eq(1)
    expect(pokemon.experience).to eq(50)
    expect(pokemon1.experience).to eq(100)
    expect(pokemon1.ranking_points).to eq(1020)
    expect(pokemon.ranking_points).to eq(980)
    expect(Fight.last.winner).to eq(pokemon1)
    expect(Fight.last.looser).to eq(pokemon)
  end

end

