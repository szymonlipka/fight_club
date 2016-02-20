class AddAvatarColumnsToPokemons < ActiveRecord::Migration
  def up
    add_attachment :pokemons, :avatar
  end

  def down
    remove_attachment :pokemons, :avatar
  end
end
