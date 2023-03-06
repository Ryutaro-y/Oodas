class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :location, foreign_key: :ink_name, primary_key: :ink_name
  validates :ink_name, uniqueness: true
end
