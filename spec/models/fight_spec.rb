require 'rails_helper'

RSpec.describe Fight, type: :model do

  # describe 'validates' do
  #   it { should validate_presence_of :name }
  #   it { should validate_presence_of :value }
  # end

  describe 'associations' do
    it { should belong_to :pokemon }
    it { should belong_to :competitor }
  end

  describe 'db columns' do
    it { should have_db_column :pokemon_id }
    it { should have_db_column :competitor_id }
  end

end
