class FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(params[:pokemon_id], params[:competitor_id])
    @fight.find_winner
    if @fight.save
      Flash.now('#{fight.winner.full_name} won')
      render @fight
    else
      Flash.now('Something went wrong')
      render 'new'
    end
  end

  def show
  end
end
