class Pokemon < ActiveRecord::Base
  has_many :inverse_fights, class_name: "Fight", foreign_key: "competitor_id"
  has_many :fights
  has_many :skills
  validates_presence_of :first_name, :last_name, :experience
  validate :sum_of_skill_values, :minimum_skills, :max_skills
  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def minimum_skills
    sum = 0
    skills.each do |skill|
      sum += 1 unless skill[:value] == 0
    end
    errors.add(:skills_count, 'at least 3 skills have to be with value') unless sum >= 3
  end

  def max_skills
    errors.add(:max_skills, 'you have to have exacly 8 skills') unless skills.length == 8
  end

  def sum_of_skill_values
    sum = 0
    skills.each do |skill|
      sum += skill[:value]
    end
    errors.add(:sum_of_skill, 'SKILL VALUES HAVE TO BE EQUAL TO 10 AND YOU MADE IT ' + sum.to_s) unless sum == 10
  end

  def calculate_battle_points
    battle_points = ((skills[0].value + skills[1].value) ** 2) +
      ((skills[2].value ** 3) + (skills[3].value ** 2)) +
      ((skills[4].value + skills[5].value)/2) +
      ((skills[6].value + skills[7].value)/4)
    update_attribute(:battle_points, battle_points)
  end
  
  def ranking
    Pokemon.all.order('ranking_points DESC').index(self) + 1
  end
  
  def all_fights
    fights
    inverse_fights
  end

  def full_name
    first_name + ' ' + last_name
  end

end
