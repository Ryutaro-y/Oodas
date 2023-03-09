class Stock < ApplicationRecord
    belongs_to :user
    belongs_to :location, foreign_key: :ink_name, primary_key: :ink_name
    validates :ink_name, uniqueness: true

    def self.looks(search, word)
      @stocks = Stock.joins(:user)
                .joins("LEFT OUTER JOIN locations ON stocks.ink_name = locations.ink_name")
                .where("stocks.ink_name LIKE ? OR stocks.color_type LIKE ? OR stocks.location_name LIKE ? OR users.name LIKE ?", 
                      "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%")

    end
end
