class StaticPagesController < ApplicationController

  def home
    @pokemons = Pokemon.order('ranking_points DESC').limit(5)
  end

end