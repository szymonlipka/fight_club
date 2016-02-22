class AddSkillsToPokemons < ActiveRecord::Migration
  def change
    change_table :pokemons do |t|
      t.column :flying, :integer, default: 0
      t.column :speed, :integer, default: 0
      t.column :strength, :integer, default: 0
      t.column :wisdom, :integer, default: 0
      t.column :tactics, :integer, default: 0
      t.column :learning, :integer, default: 0
      t.column :inference, :integer, default: 0
      t.column :agility, :integer, default: 0
    end
    drop_table :skills
  end
end
