class AddUniqueConstraintToLocations < ActiveRecord::Migration[6.1]
  def change
    add_index :locations, :ink_name, unique: true
  end
end
