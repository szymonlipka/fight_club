class Skill < ActiveRecord::Base

  belongs_to :pokemon
  validates_presence_of :name, :value
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  POSSIBLE_NAMES = ['Flying', 'Speed', 'Strength', 'Wisdom', 'Tactics', 'Learning', 'Inference', 'Agility']
  validates :name, inclusion: { in: POSSIBLE_NAMES }

end
