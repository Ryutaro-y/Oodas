class Location < ApplicationRecord
    has_many :stock
    validates :ink_name, uniqueness: true
end
