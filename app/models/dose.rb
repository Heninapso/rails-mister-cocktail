class Dose < ApplicationRecord
  validates :description, presence: true
  # validates [:cocktail, :ingredient], uniqueness: true
  validates_uniqueness_of :ingredient, scope: :cocktail
  # validates_uniqueness_of :cocktail_id, :scope => :ingredient_id
  # validates :cocktail_id, presence: true
  # validates :ingredient_id, presence: true
  belongs_to :cocktail
  belongs_to :ingredient

end
