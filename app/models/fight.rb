class Fight < ActiveRecord::Base

  before_save :find_winner
  belongs_to :pokemon
  belongs_to :competitor, inverse_of: :pokemon, class_name: 'Pokemon'

  private

  def find_winner
    
  end

end
