class Supplier < ApplicationRecord
    has_many :orders

    def self.looks(search, word)
        @suppliers = Supplier.where("name LIKE?","%#{word}%").or(Supplier.where("email LIKE?","%#{word}%"))
    end
end
