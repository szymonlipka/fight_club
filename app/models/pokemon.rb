class Pokemon < ActiveRecord::Base

  has_many :inverse_fights, class_name: "Fight", foreign_key: "competitor_id"
  has_many :fights
  has_many :skills
  validates_presence_of :first_name, :last_name, :experience

  def challange(competitor)
    unless competitor == self
      fight = competitor.inverse_fights.build
      fights << fight
      fight.save
    end
  end

  def all_fights
    super
    inverse_fights
  end

  def full_name
    first_name + last_name
  end

end
