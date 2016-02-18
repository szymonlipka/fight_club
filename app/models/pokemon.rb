class Pokemon < ActiveRecord::Base

  has_many :inverse_fights, class_name: "Fight", foreign_key: "competitor_id"
  has_many :fights
  has_many :skills
  validates_presence_of :first_name, :last_name, :experience

  def calculate_battle_points
    battle_points = (skills.find_by(name: 'Flying').value ^ skills.find_by(name: 'Speed').value) 
    + ((skills.find_by(name: 'Strength').value ^ 3) * (skills.find_by(name: 'Agility').value ^ 2)) 
    + ((skills.find_by(name: 'Wisdom').value ^ skills.find_by(name: 'Tactics').value)/2)
    + ((skills.find_by(name: 'Inference').value ^ skills.find_by(name: 'Learning').value)/4)
    update_attribute(:battle_points, battle_points)
  end

  def all_fights
    super
    inverse_fights
  end

  def full_name
    first_name + last_name
  end

end
