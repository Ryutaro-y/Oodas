class User < ApplicationRecord

    has_secure_password

    has_many :stocks
    has_many :orders
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

    def self.looks(search, word)
        @users = User.where("name LIKE?","%#{word}%")
    end
end
