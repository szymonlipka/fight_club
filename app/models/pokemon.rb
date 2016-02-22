class Pokemon < ActiveRecord::Base
  has_many :inverse_fights, class_name: "Fight", foreign_key: "competitor_id"
  has_many :fights
  validates_presence_of :first_name, :last_name, :experience
  validate :sum_of_skill_values, :minimum_skills
  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :flying, :speed, :strength, :wisdom, :tactics, :learning, :inference, :agility,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def minimum_skills
    sum = 0
    [flying, speed, strength, wisdom, tactics, learning, inference, agility].each {|skill| sum += 1 unless skill == 0}
    errors.add(:skills_count, 'at least 3 skills have to be with value') unless sum >= 3
  end

  def sum_of_skill_values
    sum = 0
    [flying, speed, strength, wisdom, tactics, learning, inference, agility].each do |skill|
      sum += skill
    end
    errors.add(:sum_of_skill, 'SKILL VALUES HAVE TO BE EQUAL TO 10 AND YOU MADE IT ' + sum.to_s) unless sum == 10
  end
  
  def calculate_battle_points
    battle_points = ((flying + speed) ** 2) +
      ((strength ** 3) + (wisdom ** 2)) +
      ((tactics + learning)/2) +
      ((inference + agility)/4)
    update_attribute(:battle_points, battle_points)
  end
  
  def ranking
    Pokemon.order('ranking_points DESC').index(self) + 1
  end

  def full_name
    first_name + ' ' + last_name
  end

end
