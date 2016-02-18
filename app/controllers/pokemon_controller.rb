class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.order('fights_won - fights_lost').paginate(page: params[:page])
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
    @skill1 = Skill.new(name: 'Flying')
    @skill2 = Skill.new(name: 'Speed')
    @skill3 = Skill.new(name: 'Strength')
    @skill4 = Skill.new(name: 'Wisdom')
    @skill5 = Skill.new(name: 'Tactics')
    @skill6 = Skill.new(name: 'Learning')
    @skill7 = Skill.new(name: 'Inference')
    @skill8 = Skill.new(name: 'Agility')
  end

  def create
    @pokemon = Pokemon.new(first_name: params[:pokemon][:first_name], last_name: params[:pokemon][:last_name], description: params[:pokemon][:description])
    @skill1 = Skill.new(name: 'Flying', value: params[:flying][:value])
    @skill2 = Skill.new(name: 'Speed', value: params[:speed][:value])
    @skill3 = Skill.new(name: 'Strength', value: params[:strength][:value])
    @skill4 = Skill.new(name: 'Wisdom', value: params[:wisdom][:value])
    @skill5 = Skill.new(name: 'Tactics', value: params[:tactics][:value])
    @skill6 = Skill.new(name: 'Learning', value: params[:learning][:value])
    @skill7 = Skill.new(name: 'Inference', value: params[:inference][:value])
    @skill8 = Skill.new(name: 'Agility', value: params[:agility][:value])
    if @pokemon.save
      Flash.now('Congratz youve created pokemon!')
      render @pokemon
    else
      Flash.now('Something went wrong')
    end
  end

end
