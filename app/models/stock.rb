class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :location_stage, class_name: 'Location', primary_key: 'stage', foreign_key: 'stage'
end
