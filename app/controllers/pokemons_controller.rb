class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order('ranking_points DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      @pokemon.calculate_battle_points
      flash[:notice] = 'Congratz youve created pokemon!'
      redirect_to @pokemon
    else
      render 'new'
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:first_name, :last_name, :description, :avatar, :flying, :speed, :strength, :wisdom, :tactics, :learning, :inference, :agility)
  end

end
