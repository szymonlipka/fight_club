require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe 'validates' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :experience }
  end

  describe 'associations' do
    it { should have_many :battles }
    it { should have_many :abilities }
  end

  describe 'db columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
    it { should have_db_column :experience }
    it { should have_db_column :description }
    it { should have_db_column :created_at }
    it { should have_db_column :updated_at }
  end

end
