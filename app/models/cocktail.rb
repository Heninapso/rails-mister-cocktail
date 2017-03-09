class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :dose, dependent: :destroy
  has_many :ingredients, :through :dose
end
