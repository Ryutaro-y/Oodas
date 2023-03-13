require 'csv'
require 'bcrypt'

CSV.foreach('db/csv/inks.csv', headers: true) do |row|
    Ink.create!(row.to_hash)
end

CSV.foreach('db/csv/locations.csv', headers: true) do |row|
    Location.create!(row.to_hash)
end

CSV.foreach('db/csv/users.csv', headers: true) do |row|
    password = row['password'] # パスワードを取得
    password_digest = BCrypt::Password.create(password) # パスワードをハッシュ化
    row['password_digest'] = password_digest # password_digestの値を置き換える
    User.create!(row.to_hash)
end

CSV.foreach('db/csv/stocks.csv', headers: true) do |row|
    Stock.create!(row.to_hash)
end

CSV.foreach('db/csv/suppliers.csv', headers: true) do |row|
    Supplier.create!(row.to_hash)
end