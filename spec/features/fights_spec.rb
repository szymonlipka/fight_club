require "rails_helper"

describe  'adding fights' do
  it 'is possible' do
    pokemon = Pokemon.create(first_name: "MyString", last_name: "MyString", learning: 5, inference: 4, agility: 1)
    pokemon1 = Pokemon.create(first_name: "MyString1", last_name: "MyString1", flying: 4, speed: 4, strength: 2)
    pokemon.calculate_battle_points
    pokemon1.calculate_battle_points
    visit new_fight_path
    print page.html
    find('#fight_pokemon_id').find(:xpath, 'option[1]').select_option
    find('#fight_competitor_id').find(:xpath, 'option[2]').select_option
    click_button 'FIGHT!'
    expect(page).to have_content Pokemon.last.full_name + ' won'
    expect(Pokemon.first.fights_lost).to eq(1)
    expect(Pokemon.last.fights_won).to eq(1)
    expect(Pokemon.first.experience).to eq(400)
    expect(Pokemon.last.experience).to eq(50)
    expect(Pokemon.last.ranking_points).to eq(1020)
    expect(Pokemon.first.ranking_points).to eq(980)
    expect(Fight.last.winner).to eq(pokemon1)
    expect(Fight.last.looser).to eq(pokemon)
  end

end

