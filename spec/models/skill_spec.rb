require 'rails_helper'

RSpec.describe Skill, type: :model do
  
  describe 'validates' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :value }
    it do
      should validate_inclusion_of(:name).in_array(['Flying', 'Speed', 'Strength', 'Wisdom', 'Tactics', 'Learning', 'Inference', 'Agility'])
    end
    it do should validate_numericality_of(:value).
      is_less_than_or_equal_to(5).
      is_greater_than_or_equal_to(0)
    end
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
