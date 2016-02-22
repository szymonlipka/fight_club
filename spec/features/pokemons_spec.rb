require 'rails_helper'

describe 'adding pokemons' do
  it 'is possible' do
    visit new_pokemon_path
    fill_in 'First name', with: 'Poke'
    fill_in 'Last name', with: 'mon'
    find('#pokemon_flying').find(:xpath, 'option[5]').select_option
    find('#pokemon_strength').find(:xpath, 'option[5]').select_option
    find('#pokemon_wisdom').find(:xpath, 'option[3]').select_option
    click_button 'Create Pokemon'
    expect(page).to have_content 'Congratz youve created pokemon!'
    expect(Pokemon.last.full_name).to eq('Poke mon')
    expect(Pokemon.last.flying).to eq(4)
    expect(Pokemon.last.strength).to eq(4)
    expect(Pokemon.last.wisdom).to eq(2)
  end
end