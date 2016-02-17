class FightsController < ApplicationController
  include FightsHelper
  def new
  end

  def create
    pokemon1 = Pokemon.find(params[:pokemon_id])
    pokemon2 = Pokemon.find(params[:competitor_id])
    if add_fight(pokemon1, pokemon2)
      Flash.now('#{@fight.find_winner.full_name} won')
      render @fight
    else
      Flash.now('Something went wrong')
      render 'new'
    end
  end

  def show
  end
end
