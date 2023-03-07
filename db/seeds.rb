require 'csv'

CSV.foreach('db/csv/inks.csv', headers: true) do |row|
    Ink.create!(row.to_hash)
end

CSV.foreach('db/csv/locations.csv', headers: true) do |row|
    Location.create!(row.to_hash)
end