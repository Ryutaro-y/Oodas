class Supplier < ApplicationRecord
    has_many :orders
    validates :name, presence: true
    validates :email, presence: true

    def self.looks(search, word)
        @suppliers = Supplier.where("name LIKE?","%#{word}%").or(Supplier.where("email LIKE?","%#{word}%"))
    end
end
