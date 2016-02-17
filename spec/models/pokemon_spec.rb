require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe 'validates' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :experience }
  end

  describe 'associations' do
    it { should have_many :fights }
    it { should have_many :inverse_fights }
    it { should have_many :skills }
  end

  describe 'db columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
    it { should have_db_column :experience }
    it { should have_db_column :description }
    it { should have_db_column :created_at }
    it { should have_db_column :updated_at }
  end

  describe 'methods' do

    let(:pokemon){create(:pokemon)}
    let(:pokemon1){create(:pokemon1)}
    it 'cant challange itself' do
      expect(pokemon.challange(pokemon)).to_not be_truthy
    end

    it 'can challange other pokemon' do
      expect(pokemon.challange(pokemon1)).to be_truthy
      expect(pokemon.fights.first).not_to be_nil
      expect(pokemon1.inverse_fights.first).not_to be_nil
    end

  end

end
