require 'rails_helper'

RSpec.describe Ability, type: :model do
  
  describe 'validates' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :value }
  end

  describe 'associations' do
    it { should belong_to :pokemon }
  end

  describe 'db columns' do
    it { should have_db_column :name }
    it { should have_db_column :value }
    it { should have_db_column :pokemon_id }
  end

end
