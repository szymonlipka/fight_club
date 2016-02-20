class FightsController < ApplicationController

  def new
    @fight = Fight.new
  end

  def create
    if params[:fight][:pokemon_id] != params[:fight][:competitor_id]
      @fight = Fight.new(pokemon_id: params[:fight][:pokemon_id], competitor_id: params[:fight][:competitor_id])
      @fight.find_winner
      if @fight.save
        flash[:notice] = @fight.winner.full_name + ' won'
        redirect_to root_path
      else
        flash[:danger] = 'Something went wrong'
        render 'new'
      end
    else
      flash[:danger] = 'You cant fight with the same pokemons'
      render 'new'
    end
  end

end
