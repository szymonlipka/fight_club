class AddBattlePointsToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :battle_points, :integer
  end
end
