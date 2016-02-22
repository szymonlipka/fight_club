class FightsController < ApplicationController

  def new
    @fight = Fight.new
  end

  def create
    if params[:fight][:pokemon_id] != params[:fight][:competitor_id]
      @fight = Fight.new(fight_params)
      @fight.find_winner
      if @fight.save
        flash[:notice] = @fight.winner.full_name + ' won'
        redirect_to root_path
      else
        flash[:danger] = 'Something went wrong'
        redirect_to new_fight_path
      end
    else
      flash[:danger] = 'You cant fight with the same pokemons'
      redirect_to new_fight_path
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:competitor_id, :pokemon_id)
  end

end
