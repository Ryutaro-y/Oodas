class Ink < ApplicationRecord
    has_many :locations, foreign_key: :ink_name, primary_key: :name
    validates :name, uniqueness: true
end
