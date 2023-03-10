class User < ApplicationRecord
    has_many :stocks
    has_many :orders
    validates :name, presence: true

    def self.looks(search, word)
        @users = User.where("name LIKE?","%#{word}%")
    end
end
