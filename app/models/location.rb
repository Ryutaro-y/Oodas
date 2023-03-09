class Location < ApplicationRecord
    has_many :stocks, foreign_key: :ink_name, primary_key: :ink_name
    belongs_to :ink, foreign_key: :ink_name, primary_key: :name
    validates :ink_name, uniqueness: { scope: :stage }
    validates :stage, uniqueness: { scope: :ink_name }

    def self.looks(search, word)
        @locations = Location.where("name LIKE?","%#{word}%").or(Location.where("ink_name LIKE?","%#{word}%"))
    end
end
