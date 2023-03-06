require 'csv'

CSV.foreach('db/csv/inks.csv', headers: true) do |row|
    Ink.create!(row.to_hash)
end