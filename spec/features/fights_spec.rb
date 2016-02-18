# require "rails_helper"

# describe  'adding fights' do
#   before(:all) do
#     let(:pokemon){create(:pokemon)}
#     let(:pokemon2){create(:pokemon2)}
#   end
#   it 'is possible' do
#     visit new_fight_path
#       find('#pokemon-select').find(:xpath, 'option[1]').select_option
#       find('#competitor-select').find(:xpath, 'option[2]').select_option
#       click_button 'Fight'
#       expect(page).to have_content '#{pokemon2.full_name} won'
#       expect(pokemon2.experience).to eq(50)
#       expect(pokemon2.experience).to eq(25)
#       expect(Fight.last.winner).to eq(pokemon2)
#       expect(Fight.last.looser).to eq(pokemon)
#     end

# end