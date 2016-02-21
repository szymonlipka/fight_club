class AddRankingPointsToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :ranking_points, :integer, default: 1000
  end
end
