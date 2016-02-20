class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order('fights_won - fights_lost DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
    @skills = @pokemon.skills.build([{name: 'Flying'},
                          {name: 'Speed'},
                          {name: 'Strength'},
                          {name: 'Wisdom'},
                          {name: 'Tactics'},
                          {name: 'Learning'},
                          {name: 'Inference'},
                          {name: 'Agility'}])
  end

  def create
    @pokemon = Pokemon.new(first_name: params[:pokemon][:first_name], last_name: params[:pokemon][:last_name], description: params[:pokemon][:description])
    @skills = @pokemon.skills.build([{name: 'Flying', value: params[:pokemon][:skill][:flying][:value]},
                          {name: 'Speed', value: params[:pokemon][:skill][:speed][:value]},
                          {name: 'Strength', value: params[:pokemon][:skill][:strength][:value]},
                          {name: 'Wisdom', value: params[:pokemon][:skill][:wisdom][:value]},
                          {name: 'Tactics', value: params[:pokemon][:skill][:tactics][:value]},
                          {name: 'Learning', value: params[:pokemon][:skill][:learning][:value]},
                          {name: 'Inference', value: params[:pokemon][:skill][:inference][:value]},
                          {name: 'Agility', value: params[:pokemon][:skill][:agility][:value]}])
    @pokemon.calculate_battle_points
    if @pokemon.save
      flash[:notice] = 'Congratz youve created pokemon!'
      redirect_to @pokemon
    else
      render 'new'
    end
  end

end
