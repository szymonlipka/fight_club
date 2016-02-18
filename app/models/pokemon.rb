class Pokemon < ActiveRecord::Base

  has_many :inverse_fights, class_name: "Fight", foreign_key: "competitor_id"
  has_many :fights
  has_many :skills
  validates_presence_of :first_name, :last_name, :experience

  def calculate_battle_points
    battle_points = ((skills[0].value + skills[1].value) ** 2) +
    ((skills[2].value ** 3) + (skills[3].value ** 2)) +
    ((skills[4].value + skills[5].value)/2) +
     ((skills[6].value + skills[7].value)/4)
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
