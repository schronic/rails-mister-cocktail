class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :doses
  has_many :cocktails, through: :doses
end
