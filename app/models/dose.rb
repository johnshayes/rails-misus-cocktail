class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient } # combined uniqueness?

  # Alt?: validates :cocktail_id, :uniqueness => {:scope => :ingredient_id}
end
