class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order('fights_won - fights_lost DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
    @skill1 = @pokemon.skills.build(name: 'Flying')
    @skill2 = @pokemon.skills.build(name: 'Speed')
    @skill3 = @pokemon.skills.build(name: 'Strength')
    @skill4 = @pokemon.skills.build(name: 'Wisdom')
    @skill5 = @pokemon.skills.build(name: 'Tactics')
    @skill6 = @pokemon.skills.build(name: 'Learning')
    @skill7 = @pokemon.skills.build(name: 'Inference')
    @skill8 = @pokemon.skills.build(name: 'Agility')
  end

  def create
    @pokemon = Pokemon.new(first_name: params[:pokemon][:first_name], last_name: params[:pokemon][:last_name], description: params[:pokemon][:description])
    @skill1 = @pokemon.skills.build(name: 'Flying', value: params[:pokemon][:flying][:value])
    @skill2 = @pokemon.skills.build(name: 'Speed', value: params[:pokemon][:speed][:value])
    @skill3 = @pokemon.skills.build(name: 'Strength', value: params[:pokemon][:strength][:value])
    @skill4 = @pokemon.skills.build(name: 'Wisdom', value: params[:pokemon][:wisdom][:value])
    @skill5 = @pokemon.skills.build(name: 'Tactics', value: params[:pokemon][:tactics][:value])
    @skill6 = @pokemon.skills.build(name: 'Learning', value: params[:pokemon][:learning][:value])
    @skill7 = @pokemon.skills.build(name: 'Inference', value: params[:pokemon][:inference][:value])
    @skill8 = @pokemon.skills.build(name: 'Agility', value: params[:pokemon][:agility][:value])
    if @pokemon.save
      Flash.now('Congratz youve created pokemon!')
      render @pokemon
    else
      Flash.now('Something went wrong')
    end
  end

end
