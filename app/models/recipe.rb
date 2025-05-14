class Recipe < ApplicationRecord
    has_many :bookmarks

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :rating, presence: true, inclusion: { in: 0..5 }

end
