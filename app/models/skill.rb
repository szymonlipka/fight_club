class Skill < ActiveRecord::Base

  belongs_to :pokemon
  validates_presence_of :name, :value
  POSSIBLE_NAMES = ['Flying', 'Speed', 'Strength', 'Wisdom', 'Tactics', 'Learning', 'Inference', 'Agility']
  
end
