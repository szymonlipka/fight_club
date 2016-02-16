class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :pokemon_id
      t.integer :competitor_id
      
      t.timestamps null: false
    end
  end
end
