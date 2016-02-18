class AddFightsWonAndLostToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :fights_won, :integer, default: 0
    add_column :pokemons, :fights_lost, :integer, default: 0
  end
end
