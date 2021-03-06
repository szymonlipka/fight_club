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
  end

  describe 'paperclip avatars' do
    it { should have_attached_file(:avatar) }
    it { should validate_attachment_content_type(:avatar).
                  allowing('image/png', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
  end

  describe 'db columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
    it { should have_db_column :experience }
    it { should have_db_column :description }
    it { should have_db_column :created_at }
    it { should have_db_column :updated_at }
  end

  describe 'method' do

    let(:pokemon){create(:pokemon)}
    let(:pokemon1){create(:pokemon1)}

    it 'calculates properly battle points' do
      pokemon.calculate_battle_points
      pokemon1.calculate_battle_points
      expect(pokemon.battle_points).to eq(3)
      expect(pokemon1.battle_points).to eq(72)
    end

  end

end
