class Order < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  belongs_to :stock, foreign_key: :ink_name, primary_key: :ink_name
end
