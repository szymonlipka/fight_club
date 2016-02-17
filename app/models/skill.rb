class Skill < ActiveRecord::Base

  belongs_to :pokemon
  validates_presence_of :name, :value
  
end
