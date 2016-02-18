class Fight < ActiveRecord::Base
  belongs_to :winner, foreign_key: :pokemon_id, class_name: 'Pokemon'
  belongs_to :looser, foreign_key: :competitor_id, class_name: 'Pokemon'

  def find_winner
    battle_points1 = winner.battle_points * (winner.experience/50) unless winner.experience == 0
    battle_points2 = looser.battle_points * (looser.experience/50) unless looser.experience == 0
    if battle_points2 > battle_points1
      update_attributes(pokemon_id: competitor_id, competitor_id: pokemon_id)
    elsif battle_points2 == battle_points1
      rand = Random.new
      update_attributes(pokemon_id: competitor_id, competitor_id: pokemon_id) if rand.rand(1..2) == 1
    end
    (winner.skills.find_by(name: 'Learning').value == 0) ? (winning_exp = winner.experience + (50 * (winner.skills.find_by(name: 'Learning').value * 2))) : (winning_exp = winner.experience + 50)
    (looser.skills.find_by(name: 'Inference').value == 0) ? (loosing_exp = looser.experience + (50 * (looser.skills.find_by(name: 'Inference').value * 2))) : (loosing_exp = looser.experience + 50)
    winner.update_attribute(:experience, winning_exp)
    winner.increment(:fights_won)
    looser.increment(:fights_lost)
  end

end
