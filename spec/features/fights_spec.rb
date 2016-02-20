require "rails_helper"

describe  'adding fights' do
  before(:each) do
    @pokemon = Pokemon.new(first_name: 'Ja', last_name: 'Ja')
    @pokemon1 = Pokemon.new(first_name: 'Ja1', last_name: 'Ja1')
    @pokemon.skills << Skill.create([
      {name: 'Flying', value: '3'}, 
      {name: 'Speed', value: '1'}, 
      {name: 'Strength', value: '1'},
      {name: 'Wisdom', value: '0'},
      {name: 'Tactics', value: '0'},
      {name: 'Learning', value: '1'},
      {name: 'Inference', value: '0'},
      {name: 'Agility', value: '4'}])
    @pokemon.save
    @pokemon1.skills << Skill.create([
      {name: 'Flying', value: '0'}, 
      {name: 'Speed', value: '0'}, 
      {name: 'Strength', value: '5'},
      {name: 'Wisdom', value: '3'},
      {name: 'Tactics', value: '1'},
      {name: 'Learning', value: '1'},
      {name: 'Inference', value: '0'},
      {name: 'Agility', value: '0'}])
    @pokemon1.save
    @pokemon.calculate_battle_points
    @pokemon1.calculate_battle_points
  end
  it 'is possible' do
    visit new_fight_path
    find('#fight_pokemon_id').find(:xpath, 'option[1]').select_option
    find('#fight_competitor_id').find(:xpath, 'option[2]').select_option
    click_button 'FIGHT!'
    expect(page).to have_content Pokemon.last.full_name + ' won'
    expect(Pokemon.first.fights_lost).to eq(1)
    expect(Pokemon.last.fights_won).to eq(1)
    expect(Pokemon.first.experience).to eq(50)
    expect(Pokemon.last.experience).to eq(100)
    expect(Fight.last.winner).to eq(@pokemon1)
    expect(Fight.last.looser).to eq(@pokemon)
  end

end

