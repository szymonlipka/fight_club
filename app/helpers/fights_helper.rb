module FightsHelper
  def add_fight(pokemon, competitor)
    unless competitor == pokemon
      @fight = competitor.inverse_fights.build
      pokemon.fights << @fight
      @fight.save
    end
  end
end
