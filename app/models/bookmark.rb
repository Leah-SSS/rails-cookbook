class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :recipe, :category, presence: true
  validates :recipe_id, uniqueness: {scope: :category_id, message: "is already taken"}
end
