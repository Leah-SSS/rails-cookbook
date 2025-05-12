class Recipe < ApplicationRecord
    has_many :bookmarks

    validates :description, presence: true, uniqueness: true
    validates :rating, presence: true, inclusion: { in: 0..5 }


end
