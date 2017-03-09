class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :dose
end
