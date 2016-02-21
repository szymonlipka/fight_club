class StaticPagesController < ApplicationController

  def home
    @pokemons = Pokemon.all.order('ranking_points DESC').limit(5)
  end

end