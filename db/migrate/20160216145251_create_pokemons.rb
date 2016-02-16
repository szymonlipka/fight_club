class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :experience, default: 0, null: false
      t.timestamps null: false
    end
  end
end
