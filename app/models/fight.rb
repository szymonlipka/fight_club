class Fight < ActiveRecord::Base
  belongs_to :winner, foreign_key: :pokemon_id, class_name: 'Pokemon'
  belongs_to :looser, foreign_key: :competitor_id, class_name: 'Pokemon'

  def find_winner
    winner.experience == 0 ? battle_points1 = winner.battle_points : battle_points1 = winner.battle_points * (winner.experience/50)
    looser.experience == 0 ? battle_points2 = looser.battle_points : battle_points2 = looser.battle_points * (looser.experience/50)
    if battle_points2 > battle_points1
      update_attributes(pokemon_id: competitor_id, competitor_id: pokemon_id)
    elsif battle_points2 == battle_points1
      rand = Random.new
      update_attributes(pokemon_id: competitor_id, competitor_id: pokemon_id) if rand.rand(1..2) == 1
    end
    # Ranking points gained depend on difference between current ranking points - for example when winner has 2000 ranking
    # points and looser has 1000 points gained by winner are 10 and the same amount loosing looser
    ranking_points = 20 - (winner.ranking_points - looser.ranking_points)/100.to_f
    # Experience gained by winning or loosing is by default 50 and 25 but Learing and Inference skills can make is higher 
    (winner.skills[5].value == 0) ? (winning_exp = winner.experience + 50) : (winning_exp = winner.experience + (50 * (winner.skills[5].value * 2)))
    (looser.skills[6].value == 0) ? (loosing_exp = looser.experience + 50) : (loosing_exp = looser.experience + (50 * (looser.skills[6].value * 2)))
    winner.update_attributes(experience: winning_exp, fights_won: winner.fights_won + 1, ranking_points: winner.ranking_points + ranking_points)
    looser.update_attributes(experience: loosing_exp, fights_lost: looser.fights_lost + 1, ranking_points: looser.ranking_points - ranking_points)
  end

end
