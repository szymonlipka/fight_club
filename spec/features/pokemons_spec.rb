require 'rails_helper'

describe 'adding pokemons' do
  it 'is possible' do
    visit new_pokemon_path
    fill_in 'First name', with: 'Poke'
    fill_in 'Last name', with: 'mon'
    find('#pokemon_skill_flying_value').find(:xpath, 'option[5]').select_option
    find('#pokemon_skill_strength_value').find(:xpath, 'option[5]').select_option
    find('#pokemon_skill_wisdom_value').find(:xpath, 'option[3]').select_option
    click_button 'Create Pokemon'
    expect(page).to have_content 'Congratz youve created pokemon!'
    expect(Pokemon.last.full_name).to eq('Poke mon')
    expect(Pokemon.last.skills[0].value).to eq(4)
    expect(Pokemon.last.skills[2].value).to eq(4)
    expect(Pokemon.last.skills[3].value).to eq(2)
  end
end