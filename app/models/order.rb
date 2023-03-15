class Order < ApplicationRecord
    belongs_to :user
    belongs_to :supplier
    belongs_to :stock, foreign_key: :ink_name, primary_key: :ink_name
    validates :ink_name, presence: true
    validates :order_quantity, presence: true
    validates :order_date, presence: true

    def self.looks(search, word)
        @orders = Order.where("ink_name LIKE?","%#{word}%").or(Order.where("CAST(order_date AS TEXT) LIKE?","%#{word}%"))
    end
end
