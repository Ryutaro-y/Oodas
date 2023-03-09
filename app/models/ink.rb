class Ink < ApplicationRecord
    has_many :locations, foreign_key: :ink_name, primary_key: :name
    validates :name, uniqueness: true

    def self.looks(search, word)
        @inks = Ink.where("name LIKE?","%#{word}%").or(Ink.where("color_type LIKE?","%#{word}%"))
    end
end
